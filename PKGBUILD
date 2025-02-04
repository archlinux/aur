# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=nodejs-chalk
_pkgname=chalk
pkgver=5.4.1
pkgrel=3
pkgdesc='Terminal string styling done right.'
arch=('any')
url='https://github.com/chalk/chalk'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('84b8b9f386a76781f4482279af42d131ba852315388643999e15f95b47ffd0da')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
