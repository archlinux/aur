# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=nodejs-chalk
_pkgname=chalk
pkgver=5.0.0
pkgrel=3
pkgdesc='Terminal string styling done right.'
arch=('any')
url='https://github.com/chalk/chalk'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('adf72284973550f25f782e73034a26dd6026dd52c542555db82e2c25b249b269')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
