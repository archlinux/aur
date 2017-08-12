# Maintainer: fenuks

pkgname=javascript-typescript-langserver
pkgver=2.2.0
pkgrel=1
pkgdesc="JavaScript and TypeScript code intelligence through the Language Server Protocol"
arch=('any')
depends=('typescript')
makedepends=('npm')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('APACHE')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('5f3e42a7859d7663a72a24b88d64b51526fd555b6dda44830079d0a14094db16')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
