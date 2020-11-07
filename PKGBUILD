# Maintainer: fenuks

pkgname=fixjson
pkgver=1.1.1
pkgrel=1
pkgdesc="JSON fixer for Humans"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${fixjson}"
license=('MIT')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('dc617af1cb53f149a9dffd0b5956c4ce0c055263c1b10129e7a85fe4bd536bdd')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
