# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=cli-pride-flags
pkgver=1.2.0
pkgrel=1
pkgdesc='Displays pride flags in your terminal~'
arch=('any')
url='https://github.com/ExperiBass/cli-pride-flags'
license=('GPL3')
depends=('nodejs-chalk' 'nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('ca65bcaeb30624d6da5984e73439abda2f304fed75a0eafab5bd05b091767255')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
