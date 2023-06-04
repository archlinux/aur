pkgname=astap
pkgver=2023.05.31
pkgrel=0
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer (build from source). Qt5 version."
arch=('x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
makedepends=('lazarus')
depends=('qt5-base' 'qt5-x11extras' 'qt5pas')
source=("https://www.hnsky.org/astap_source.zip")
sha256sums=('ef6585f6cbe5909473e230e5bdd1f68b3f5eef9264f1024650f11d12f01a03da')

build() {
    cd $srcdir/
    lazbuild -B astap_linux_qt5.lpi
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
}
