# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=cli-pride-flags
pkgver=1.5.0
pkgrel=1
pkgdesc='Displays pride flags in your terminal~'
arch=('any')
url='https://github.com/ExperiBass/cli-pride-flags'
license=('GPL3')
depends=('nodejs-chalk' 'nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('56195ee05e3fc7a4a1b14157bc18dc39f3171c3d65060f8c0687403a4832a805')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
