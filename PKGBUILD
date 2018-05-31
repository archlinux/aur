# Maintainer: fenuks

pkgname=javascript-typescript-langserver
pkgver=2.9.1
pkgrel=1
pkgdesc="JavaScript and TypeScript code intelligence through the Language Server Protocol"
arch=('any')
depends=('typescript')
makedepends=('npm')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('APACHE')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz)
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('d083b5b2af9b8c4426717fb51bfc38243f65cb101ff44d27d53506405ceed713')
options=('!emptydirs')
provides=()
conflicts=()

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
