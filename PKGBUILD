# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Inspired by nodejs-yaml package.

pkgname=nodejs-sql-language-server
_pkgname=sql-language-server
pkgver=1.3.1
pkgrel=1
pkgdesc="SQL Language Server"
arch=('any')
url="https://github.com/joe-re/sql-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.com/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('b0de352c455bf566c5b7fd4d97fa122c85c5d955f97f7bcc4580f4ac8cfcb724')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

