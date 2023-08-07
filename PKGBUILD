# Maintainer: Michael Beaumont <mjboamail@gmail.com>
pkgname=gsts
pkgver=5.0.2
pkgrel=1
pkgdesc="Obtain and store AWS STS credentials to interact with Amazon services by authenticating via G Suite SAML."
arch=(any)
url="https://github.com/ruimarinho/gsts"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruimarinho/gsts/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=(
    'da71331e16a7025789faa669fb4cb7a6aa8ce802159952ebf481e6b77602b7e7'
)

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    chown -R root:root "${pkgdir}"
    find "${pkgdir}/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
