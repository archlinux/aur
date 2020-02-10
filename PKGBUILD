# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=htp
pkgver=1.19
pkgrel=1
pkgdesc="HTML pre-processor"
arch=('i686' 'x86_64')
url="http://htp.sf.net"
license=('custom:artistic')
depends=('perl')
options=('docs')
makedepends=('make' 'gcc')
source=("http://downloads.sourceforge.net/htp/$pkgname-$pkgver.tar.gz")
sha512sums=('32d82bb42ef877bd815fe45fa81599a1428ad6d3269cbe53a4e686bcfe6d1c12ac2af280462768d488b1983ca67cc521da4ed78cc82d904575ffeff08c7eec1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir"/usr install
  install -D -m644 CLARIFIED_ARTISTIC "$pkgdir"/usr/share/licenses/$pkgname/CLARIFIED_ARTISTIC
}

# vim:set ts=2 sw=2 et:
