# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=htp
pkgver=1.18
pkgrel=1
pkgdesc="HTML pre-processor"
arch=('i686' 'x86_64')
url="http://htp.sf.net"
license=('custom:artistic')
depends=('perl')
options=('docs')
makedepends=('make' 'gcc')
source=("http://downloads.sourceforge.net/htp/$pkgname-$pkgver.tar.gz")
md5sums=('5ed177996785254d83695e83019c8fe5')

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
