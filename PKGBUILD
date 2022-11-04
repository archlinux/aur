# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Inspired by nodejs-yaml package.

pkgname=nodejs-sql-language-server
_pkgname=sql-language-server
pkgver=1.2.1
pkgrel=1
pkgdesc="SQL Language Server"
arch=('any')
url="https://github.com/joe-re/sql-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.com/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('d299d593dd759f9f9cf97bf5a55f5df1f324de8fda0e4a489156d73080f4bed6')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

