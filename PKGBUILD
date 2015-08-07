# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-skin-chameleon
pkgver=0.3.6
pkgrel=1
pkgdesc=('Chameleon skin (from Kolab) for the Roundcube Webmailer')
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('roundcubemail')
makedepends=('nodejs-less')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c302b923cb61cb01bf3164bcad91412924a506f090667de21af3f847a598000c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/skins/chameleon"
    lessc -x styles.less > styles.css
}

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/skins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

