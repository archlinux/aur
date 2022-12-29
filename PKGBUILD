# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-sound-theme-git
pkgver=15.10.6.r16.g20bbb53
pkgrel=1
pkgdesc="Deepin sound theme"
arch=('any')
url="https://github.com/linuxdeepin/deepin-sound-theme"
makedepends=('git')
license=('GPL3')
groups=('deepin-git')
conflicts=('deepin-artwork' 'deepin-sound-theme')
provides=('deepin-sound-theme')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-sound-theme/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
