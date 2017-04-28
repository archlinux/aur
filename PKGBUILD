# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare-git
pkgver=1.1.r9.g4652759
pkgrel=1
pkgdesc="Simple animated GIF screen recorder with an easy to use interface (latest development release)"
arch=('i686' 'x86_64')
url="https://github.com/ArsenArsen/KShare"
license=('MIT')
provides=('kshare=${pkgver}')
depends=(qt5-base qt5-x11extras)
source=(git+https://github.com/ArsenArsen/KShare.git)
sha1sums=('SKIP')

build() {
  cd "${srcdir}/KShare"
  git submodule update --init --recursive  
  qmake
  make
}

package() {
  cd "${srcdir}/KShare"
  install ./KShare "${pkgdir}/kshare"
}

pkgver() {
  cd "${srcdir}/KShare"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

