# Maintainer: fenuks

pkgname=fixjson
pkgver=1.1.0
pkgrel=1
pkgdesc="JSON fixer for Humans"
arch=('any')
depends=()
makedepends=('npm')
url="https://www.npmjs.com/package/${fixjson}"
license=('MIT')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('fa091d64759001e768e08f9edd69ff080b9435a60f2668ba6458e344d27177b1')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
