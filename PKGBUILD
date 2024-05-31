# Maintainer: Arnau Sanchez <pyarnau {at} gmail {dot} com>
pkgname="xmlindent"
pkgver="0.2.17"
pkgrel="3"
pkgdesc="XML stream reformatter written in ANSI C"
arch=(i686 x86_64)
url="http://${pkgname}.sourceforge.net/"
license=('GPL')
depends=()
makedepends=('flex')
source=(
  "https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "strlen_yytext_assertion.patch"
)
md5sums=(
  "c08be3867ee906ca69b949d55a4f3780"
  "c355159346ec9da32bb84c38c61c4b0c"
)

prepare() {
  patch -p1 -d "$srcdir/$pkgname-$pkgver" <strlen_yytext_assertion.patch
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make
  make install PREFIX=${pkgdir}/usr
}
