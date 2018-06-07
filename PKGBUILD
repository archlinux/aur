# Maintainer: fenuks

pkgname=javascript-typescript-langserver
pkgver=2.9.2
pkgrel=1
pkgdesc="JavaScript and TypeScript code intelligence through the Language Server Protocol"
arch=('any')
depends=('typescript')
makedepends=('npm')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('APACHE')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('17e9ff938e9f351473611aff4ae0a59ab02d5f448c268dc31d5b1bb14880966e')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
