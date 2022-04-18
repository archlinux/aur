# Maintainer: Davide Ferrero <bad.deid@gmail.com>
pkgname=quicktype
pkgver=15.0.261
pkgrel=3
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

sha256sums=('26953ad6e2e61ed26c893c4bf593e2ff63680eef8c2f8ef014475dffa3983103')
