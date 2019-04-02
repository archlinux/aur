# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.48
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('5a950b01cfa834c13a0657c9dea051651e91c99d300ab237def872b4661d8521')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i '/_where/d'
}
