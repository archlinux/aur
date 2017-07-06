# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare-git
pkgver=c94e170da36fe21ee53580476efdf9396d26e055c
pkgrel=1
conflicts=("kshare")
pkgdesc="A ShareX inspired cross platform utility written with Qt."
arch=('i686' 'x86_64')
url="https://github.com/ArsenArsen/KShare"
license=('MIT')
provides=('kshare=$pkgver')
depends=(qt5-base qt5-x11extras xcb-util-cursor ffmpeg libxfixes)
source=(git+https://github.com/ArsenArsen/KShare.git)
sha1sums=('SKIP')

build() {
  cd "${srcdir}/KShare"
  git checkout dev
  git submodule update --init --recursive  
  qmake
  make
}

package() {
  cd "${srcdir}/KShare"
  mkdir -p "$pkgdir/usr/bin"
  install ./KShare "$pkgdir/usr/bin/kshare"
}

