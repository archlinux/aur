# Maintainer: DeedleFake <deedlefake at users.noreply.github.com>
pkgname=complx-git
pkgver=4.10.0.0.0.g5ac638a
pkgrel=1
pkgdesc="Complx the LC-3 Simulator used in CS2110 managed by Brandon"
arch=('i686' 'x86_64')
url="https://www.github.com/TricksterGuy/complx"
license=('unknown')
depends=('wxgtk')
makedepends=('git' 'webkitgtk2')
provides=('complx')
conflicts=('complx')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
