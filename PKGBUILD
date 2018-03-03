# Maintainer: fenuks

pkgname=javascript-typescript-langserver
pkgver=2.8.0
pkgrel=1
pkgdesc="JavaScript and TypeScript code intelligence through the Language Server Protocol"
arch=('any')
depends=('typescript')
makedepends=('npm')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('APACHE')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('e149eda6e7ce2a9820b7e74225b2a4f7f8b009076c292b53d2b018839a38f62d')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
