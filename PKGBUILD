# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=cli-pride-flags
pkgver=1.0.2
pkgrel=2
pkgdesc='Displays pride flags in your terminal~'
arch=('any')
url='https://github.com/ExperiBass/cli-pride-flags'
license=('GPL3')
depends=('nodejs-chalk' 'nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('cf5950447e57760ec0375eac3f98afd96258e0b48f6ffff043239351d97c1c35')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
