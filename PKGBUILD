# Maintainer: Michael Beaumont <mjboamail@gmail.com>
pkgname=gsts
pkgver=4.0.1
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
    'e61bdd3b4f57e2291658da084a85b1242bac3d747b53099b2f45f43bd6fc97f6'
)

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    chown -R root:root "${pkgdir}"
    find "${pkgdir}/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
