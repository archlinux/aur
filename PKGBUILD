# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=mybible-module-rst
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="MyBible mobile application's RST Russian Synodal Translation bible module"
arch=('any')
url="https://gitverse.ru/naierchou/mybible-module-rst"
license=('public-domain')
depends=('sqlite3')
makedepends=('sqlite3')
source=("git+https://gitverse.ru/naierchou/mybible-module-rst.git")
sha256sums=("SKIP")

build() {
  BINARY_NAME="RST"
  cd "$srcdir/${pkgname%-git}"
  sqlite3 ${BINARY_NAME}.SQLite3 <${BINARY_NAME}.SQLite3.sql
}

package() {
  BINARY_NAME="RST"
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d $pkgdir${PREFIX}/share/mybible/modules/
  install -d $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
  cp ${BINARY_NAME}.SQLite3 $pkgdir${PREFIX}/share/mybible/modules/
  cp LICENSE $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
}
