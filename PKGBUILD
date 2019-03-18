# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.46
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('bd2e2a426bdfd76af06346c4a20469d134dd33ee98457afd8db3f1599e6f186451eb181057c97dd7383d35e66c4915f2cb42d51b818127cb3464c8cafc2f34f3')

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
