# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=nodejs-chalk
_pkgname=chalk
pkgver=5.2.0
pkgrel=3
pkgdesc='Terminal string styling done right.'
arch=('any')
url='https://github.com/chalk/chalk'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('9687d5d17a063e1b2aceaae5b83f8765eaeaf1c4bae8d74a21c1e9aeba1e4862')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
