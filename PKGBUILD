# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=mybible-module-kjv
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="MyBible mobile application's kjv bible module"
arch=('any')
url="https://gitverse.ru/naierchou/mybible-module-kjv"
license=('public-domain')
depends=('sqlite3')
makedepends=('sqlite3')
source=("git+https://gitverse.ru/naierchou/mybible-module-kjv.git")
sha256sums=("SKIP")

build() {
  cd "$srcdir/${pkgname%-git}"
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  ./prepare
  make install BASEDIR="$pkgdir"
}
