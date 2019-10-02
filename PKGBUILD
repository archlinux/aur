# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.62
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('8cb7d3d1699e152a4db5681dad49e4f8b9bdba109ddd0a0ee19d1276afa0b588')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i '/_where/d'
}
