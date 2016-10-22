# Maintainer: Genki Marshall <genki at genki dot is>

pkgname=human-git
pkgver=20160501.50c80e6
pkgrel=1
pkgdesc="Output a number in human-readable format"
arch=('x86_64')
url="http://git.z3bra.org/human"
license=('wtfpl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+git://z3bra.org/human')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
