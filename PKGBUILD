# Maintainer: fenuks

pkgname=fixjson
pkgver=1.1.2
pkgrel=1
pkgdesc="JSON fixer for Humans"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${fixjson}"
license=('MIT')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('28bcae94ecfbe7495f778066216946fd1858c1ff612981f4f3d6fa12a884c879')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
