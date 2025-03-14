# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=mybible-module-ogb
pkgver=0.0.1
pkgrel=1
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="MyBible mobile application's OGB (old georgian bible) module"
arch=('any')
url="https://gitverse.ru/naierchou/mybible-module-ogb"
license=('public-domain')
depends=('sqlite3')
makedepends=('sqlite3')
source=("git+https://gitverse.ru/naierchou/mybible-module-ogb.git")
sha256sums=("SKIP")

build() {
  BINARY_NAME="OGB"
  cd "$srcdir/${pkgname%-git}"
  sqlite3 ${BINARY_NAME}.SQLite3 <${BINARY_NAME}.SQLite3.sql
}

package() {
  BINARY_NAME="OGB"
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d $pkgdir${PREFIX}/share/mybible/modules/
  install -d $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
  cp ${BINARY_NAME}.SQLite3 $pkgdir${PREFIX}/share/mybible/modules/
  cp LICENSE $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
}
