# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae-launcher
pkgname=fs-uae-launcher-devel
pkgver=2.7.12dev
pkgrel=1
pkgdesc="Launcher and configuration program for FS-UAE (development version)."
arch=("any")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("fs-uae-devel" "python-pyqt5" "python-setuptools" "python-opengl>=3.1.0"
        "python-lhafile" "hicolor-icon-theme" "xdg-utils")
optdepends=("p7zip: for .7z zip support")
install="${pkgname}.install"
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
#source=("http://ppa.launchpad.net/fengestad/devel/ubuntu/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
provides=("fs-uae-launcher")
conflicts=("fs-uae-launcher")
md5sums=('5bc9f043f6376a75b5579272156095f8')



build() {
   cd ${_pkgname}-${pkgver}
   make
}


package() {
   cd ${_pkgname}-${pkgver}
   make install DESTDIR="${pkgdir}" prefix=/usr
   # remove included six, OpenGL
   rm -rf "${pkgdir}"/usr/share/${_pkgname}/six
   rm -rf "${pkgdir}"/usr/share/${_pkgname}/OpenGL
}


# vim:set ts=3 sw=3 et:

