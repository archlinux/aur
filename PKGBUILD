# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-skin-chameleon
pkgver=0.3.5
pkgrel=1
pkgdesc=('Chameleon skin (from Kolab) for the Roundcube Webmailer')
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('roundcubemail')
makedepends=('nodejs-less')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fae89719ad30daa2cba03b77d6df9c20266490fc3407c50ce990511f96a0451d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/skins/chameleon"
    lessc -x styles.less > styles.css
}

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/skins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

