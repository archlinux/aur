# Maintainer: Gancho Manev <gmanev@designer.bg>
pkgname=xerox-workcentre-5135-5150
pkgver=5.131.7.0
pkgrel=1
pkgdesc="Xerox WorkCentre 5135/5150 printer driver for CUPS"
arch=("x86_64")
url="http://www.support.xerox.com/support/workcentre-5845-5855"
source=("http://download.support.xerox.com/pub/drivers/WC5135_WC5150/drivers/wins2003/en_GB/WC5135_5150_EnglishB.zip")
license=('custom')
sha512sums=('2a94f36aeae4cdda5eeb77beb395b94d7e49c3d2cb47753f73f60a66eff107a0105097325ad052dbdc2a4b0b7c089b7492b8508e42cc54d1d0cdacf9eda4a910')
makedepends=('p7zip')
depends=('libcups')

prepare() {
    cd ${srcdir}
    7z e -y WC5135_5150_EnglishB.zip *.ppd
}

package() {
    _targetdir=${pkgdir}/usr/share/ppd/Xerox
    cd ${srcdir}
    install -d --mode=755 "${_targetdir}"
    install --mode=644 --target-directory="${_targetdir}" *.ppd
}
