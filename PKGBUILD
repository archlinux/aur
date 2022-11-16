# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=nodejs-markdown-table-formatter
_pkgname=${pkgname#nodejs-}
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool for checking markdown table formatting and applying fixes"
arch=('any')
url="https://github.com/nvuillam/markdown-table-formatter"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
sha256sums=('2d110d7f26119fbbefc6e48e43d1c881db419bedc04eca5d32e28ced68d71aa9')
