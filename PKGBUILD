# Maintainer: Helge Willum Larsen <helgesdk@gmail.com>
pkgname=xlennart-git
pkgver=r69.095b6c5
pkgrel=1
pkgdesc="An XBill Modification [battle against the SystenD virus]."
url="https://github.com/Xylemon/xlennart"
arch=('any')
license=('GPL2')
depends=('libxpm')
makedepends=('git')
source=('git+http://github.com/Xylemon/xlennart.git')
sha256sums=('SKIP')
_gitname=xlennart

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

