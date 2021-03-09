# Maintainer: Ben Oliver <ben@bfoliver.com>
pkgname=oasis
pkgrel=1
pkgver=2.17.0
pkgdesc="Helps you follow friends and discover new ones on Secure Scuttlebutt (SSB)."
arch=('any')
url='https://github.com/fraction/oasis'
license=('AGPL3')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://github.com/fraction/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('25ffb6dbc852c1f2ded2c24ce333c352')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    chown -R root:root "${pkgdir}"
}

