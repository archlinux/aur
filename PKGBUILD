# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Inspired by nodejs-yaml package.

pkgname=nodejs-sql-language-server
_pkgname=sql-language-server
pkgver=1.3.2
pkgrel=1
pkgdesc="SQL Language Server"
arch=('any')
url="https://github.com/joe-re/sql-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.com/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('2631573102895bb002ebe07d62f3cc0c907ad4e7b75d4c737abf7c2d31052671')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

