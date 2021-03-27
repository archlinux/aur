# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=quicktype
pkgver=15.0.260
pkgrel=2
pkgdesc="Generate types and converters from JSON, Schema, and GraphQL"
arch=(any)
url="https://github.com/quicktype/quicktype"
license=(Apache)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
options=(!strip)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha256sums=('57ffeb7f12f3c3476bd7e0213716006b49a8159c20e63fd60cb07eefa4289b6f')
