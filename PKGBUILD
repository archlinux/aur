# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-skin-chameleon
pkgver=0.3.8
pkgrel=1
pkgdesc='Chameleon skin (from Kolab) for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('roundcubemail')
makedepends=('nodejs-less')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('594d81fb30fd969b40bad0d7fe7473d282c548418b3ec2f0066d8f4fc4cc2003')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/skins/chameleon"
    lessc -x styles.less > styles.css
}

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/skins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

