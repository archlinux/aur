# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Inspired by nodejs-yaml package.

pkgname=nodejs-dockerfile-language-server
_pkgname=dockerfile-language-server-nodejs
pkgver=0.9.0
pkgrel=1
pkgdesc="A language server for Dockerfiles powered by Node.js, TypeScript, and VSCode technologies."
arch=('any')
url="https://github.com/rcjsuen/dockerfile-language-server-nodejs"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.com/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('88a6085ca049ebdf383f3644ee699e982379e3767918bf14baedd0ef90c1e18f')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
