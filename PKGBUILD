# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.51
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('869ad7567e276ef1d2ad3e35d86dd56c7f5e3852149c96d8bc98aba54be19c85')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i '/_where/d'
}
