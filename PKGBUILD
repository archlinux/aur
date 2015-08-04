# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae-launcher
pkgname=fs-uae-launcher-devel
pkgver=2.5.33dev
pkgrel=1
pkgdesc="Launcher and configuration program for FS-UAE (development version)."
arch=("any")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("fs-uae-devel" "python-pyqt5" "python-setuptools"
        "python-lhafile" "hicolor-icon-theme" "xdg-utils")
optdepends=("p7zip: for .7z zip support")
install="${pkgname}.install"
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
#source=("http://ppa.launchpad.net/fengestad/devel/ubuntu/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
provides=("fs-uae-launcher")
conflicts=("fs-uae-launcher")
md5sums=('987ce00ada2c478f1f229ab147d83cb2')



build() {
   cd ${_pkgname}-${pkgver}
   make
}


package() {
   cd ${_pkgname}-${pkgver}
   make install DESTDIR="${pkgdir}" prefix=/usr
}


# vim:set ts=3 sw=3 et:

