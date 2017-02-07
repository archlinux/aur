# Maintainer: Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=cnijfilter-mg3500
pkgver=4.00
pkgrel=2
pkgdesc="Canon IJ Printer Driver (for mg3500 series)"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100550402.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng12' 'popt' 'libtiff' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common')
makedepends=('binutils' 'tar')
source=(
"http://gdlp01.c-wss.com/gds/4/0100005504/01/cnijfilter-mg3500series-${pkgver}-1-deb.tar.gz"
"LICENSE"
)
sha256sums=(
'c03e6b9873e60ea677ead4fa3c8285b6e323d08517b92bb9f699d84a59aaaceb'
'a64e2aa8d6a8c441d749457dffa875836fcd8cd29398ae6040038ad20189c960'
)

if [ ${CARCH} == "x86_64" ]; then
    PKGARCH=amd64
else
    PKGARCH=i386
fi

package(){
  cd ${srcdir}/cnijfilter-mg3500series-${pkgver}-1-deb/packages/
  install cnijfilter-mg3500series_${pkgver}-1_${PKGARCH}.deb ${pkgdir}

  cd ${pkgdir}
  ar -x cnijfilter-mg3500series_${pkgver}-1_${PKGARCH}.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mg3500series_${pkgver}-1_${PKGARCH}.deb
  rm data.tar.gz

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
