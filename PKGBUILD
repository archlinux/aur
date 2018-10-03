# Maintainer: fenuks

pkgname=javascript-typescript-langserver
pkgver=2.11.1
pkgrel=1
pkgdesc="JavaScript and TypeScript code intelligence through the Language Server Protocol"
arch=('any')
depends=('typescript')
makedepends=('npm')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('APACHE')
# source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
source=(${pkgname}-${pkgver}.tgz::https://github.com/sourcegraph/${pkgname}/archive/v${pkgver}.tar.gz)
# noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('b6e995992c4cab14f0a7ebea66b91ee3dac6c47b608f161c52aacfe766164ab2')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}

    # npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
