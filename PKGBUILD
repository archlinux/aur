# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Maintainer: TheEdgeOfRage <git@theedgeofrage.com>
pkgname=gsts
pkgver=5.0.4
pkgrel=1
pkgdesc="Obtain and store AWS STS credentials to interact with Amazon services by authenticating via G Suite SAML."
arch=(any)
url="https://github.com/ruimarinho/gsts"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruimarinho/gsts/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ba1b5dca60cb59c984a6c49ad8a87e658eec00d296109c5bf5fb2b2e7b810a8')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    chown -R root:root "${pkgdir}"
    find "${pkgdir}/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
