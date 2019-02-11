# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mce-dev
pkgver=1.8.19
pkgrel=1
pkgdesc="Headers defining the D-Bus method calls provided by the Mode Control Entity"
arch=('any')
url="https://github.com/maemo-leste/mce-dev"
license=('LGPL2.1')
makedepends=('doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e7eafc081ce1702b8eb42951abea58e98b54bb313e7c742b0502e2d189ed5c71bb72b4ed344537e98c9a9aa6da90bf3cfd5933a302918dd5e18552f32933a9ae')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/doc/mce-doc/html/
  install -m 644 doc/html/* $pkgdir/usr/share/doc/mce-doc/html/
}
