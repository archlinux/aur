# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.57
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('32b6d8b2703e469594c93a698414e3494ebebe3b04bd0dd8d74fc1d76c533e94')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i '/_where/d'
}
