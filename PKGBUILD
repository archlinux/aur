# Contributor: <oliver@first.in-berlin.de>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pcre-ocaml
pkgver=6.2.4
pkgrel=1
pkgdesc="OCaml bindings to PCRE (Perl Compatibility Regular Expressions)"
url="https://github.com/mmottl/pcre-ocaml"
arch=('x86_64')
license=('LGPL')
depends=('pcre')
source=("https://github.com/mmottl/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('b0ae2ce0be8742575996885f3b554ac6')
sha1sums=('19a07ce8be46b02cb90b65663fb1a2cd744766a4')
sha256sums=('5206a91a33e5da5f2262fc99d7e94d95aa870f3df5719363d5ea1b8fbbd76fd7')

build() {
  cd "$srcdir/$pkgname-$pkgver/lib"
  make byte-code-library native-code-library
}

package() {
  cd "$srcdir/$pkgname-$pkgver/lib"
  OCAML_LIB_INSTALL=${pkgdir}/usr/lib/ocaml/pcre/ make rawinstall
  cp META $pkgdir/usr/lib/ocaml/pcre/
}

