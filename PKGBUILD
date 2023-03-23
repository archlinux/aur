# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Inspired by nodejs-yaml package.

pkgname=nodejs-sql-language-server
_pkgname=sql-language-server
pkgver=1.4.0
pkgrel=1
pkgdesc="SQL Language Server"
arch=('any')
url="https://github.com/joe-re/sql-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.com/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('8c6fd882ea05dee95e18aa737180a21a9a02d683b8ec26c0b5cd83e208c9b0af')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

