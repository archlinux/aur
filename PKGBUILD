# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-skin-chameleon
pkgver=0.3.7
pkgrel=1
pkgdesc='Chameleon skin (from Kolab) for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('roundcubemail')
makedepends=('nodejs-less')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bae25f6cafb167f042be0a8a30cacb9794cb8da0a9ebb1f2cfcfc77dcc486075')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/skins/chameleon"
    lessc -x styles.less > styles.css
}

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/skins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

