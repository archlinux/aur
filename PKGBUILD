# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae-arcade
pkgname=fs-uae-arcade-devel
pkgver=2.7.8dev
pkgrel=1
pkgdesc="Full-screen game browser for FS-UAE (development version)."
arch=("any")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("fs-uae-devel" "python-pyqt5" "python-setuptools" "python-lhafile" "hicolor-icon-theme" "xdg-utils")
install="${pkgname}.install"
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
#source=("http://ppa.launchpad.net/fengestad/devel/ubuntu/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
provides=("fs-uae-game-center")
conflicts=("fs-uae-game-center" "fs-uae-game-center-devel")
replaces=("fs-uae-game-center-devel")
md5sums=('4712513e58ba22e3633917b0afa60aaf')



build() {
   cd ${_pkgname}-${pkgver}
   make
}


package() {
   cd ${_pkgname}-${pkgver}
   make install DESTDIR="${pkgdir}" prefix=/usr
   # fix bug caused by included six
   rm -rf "${pkgdir}"/usr/share/${_pkgname}/six
}


# vim:set ts=3 sw=3 et:

