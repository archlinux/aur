# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=cli-pride-flags
pkgver=1.9.0.1
_realver=1.9.0-1
pkgrel=1
pkgdesc='Displays pride flags in your terminal~'
arch=('any')
url='https://github.com/ExperiBass/cli-pride-flags'
license=('GPL3')
depends=('nodejs-chalk' 'nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${_realver}.tgz")
noextract=("${pkgname}-${_realver}.tgz")
sha256sums=('af462cf1e50c863a88f90e8d48d1f55a06451bdcddb356f1fcae0f0062b6cedf')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_realver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
