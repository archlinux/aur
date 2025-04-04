# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=mybible-module-mgb
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="MyBible mobile application's MGB (modern georgian bible) module"
arch=('any')
url="https://gitverse.ru/naierchou/mybible-module-mgb"
license=('custom')
depends=('sqlite3')
makedepends=('sqlite3')
source=("git+https://gitverse.ru/naierchou/mybible-module-mgb.git")
sha256sums=("SKIP")

build() {
  BINARY_NAME="MGB"
  cd "$srcdir/${pkgname%-git}"
  sqlite3 ${BINARY_NAME}.SQLite3 <${BINARY_NAME}.SQLite3.sql
}

package() {
  BINARY_NAME="MGB"
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d $pkgdir${PREFIX}/share/mybible/modules/
  install -d $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
  cp ${BINARY_NAME}.SQLite3 $pkgdir${PREFIX}/share/mybible/modules/
  cp LICENSE $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
}
