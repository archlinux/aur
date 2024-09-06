# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=cli-pride-flags
pkgver=1.8.0
pkgrel=1
pkgdesc='Displays pride flags in your terminal~'
arch=('any')
url='https://github.com/ExperiBass/cli-pride-flags'
license=('GPL3')
depends=('nodejs-chalk' 'nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('1dc9f56cd4a0966569b338126899687e788a1003d29fb77b36eb097a41476794')

package() {
    npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
