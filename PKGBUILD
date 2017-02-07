# Maintainer: Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=cnijfilter-mx340
pkgver=3.30
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for mx340 series)"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272202.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng12' 'popt' 'libtiff3' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common')
source=(
"http://gdlp01.c-wss.com/gds/1/0100002721/01/cnijfilter-mx340series-${pkgver}-1-i386-deb.tar.gz"
"LICENSE"
)
sha256sums=(
'1118f25a39e21eefba065a5d0bc90719f0cf8f20770824f8b9a55594a4950506'
'a64e2aa8d6a8c441d749457dffa875836fcd8cd29398ae6040038ad20189c960'
)

package(){
  cd ${srcdir}/cnijfilter-mx340series-3.30-1-i386-deb/packages/
  install cnijfilter-mx340series_3.30-1_i386.deb ${pkgdir}

  cd ${pkgdir}
  ar -x cnijfilter-mx340series_3.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx340series_3.30-1_i386.deb
  rm data.tar.gz

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/cnijfilter-mx340/LICENSE"
}
