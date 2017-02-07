# Maintainer: Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=scangearmp-mx340
pkgver=1.50
pkgrel=2
pkgdesc="Canon IJ Scanner Driver (for mx340 series)"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272801.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('scangearmp-common>=1.50')
makedepends=('binutils' 'tar')
source=(
"http://gdlp01.c-wss.com/gds/8/0100002728/01/scangearmp-mx340series-${pkgver}-1-i386-deb.tar.gz"
"LICENSE"
)
sha256sums=(
'fe4802a7dcf952c3a36db2f0ac63918217e99db4b901a22728d1a3cfa7d89b4e'
'a64e2aa8d6a8c441d749457dffa875836fcd8cd29398ae6040038ad20189c960'
)

package(){
  cd ${srcdir}/scangearmp-mx340series-${pkgver}-1-i386-deb/packages
  install scangearmp-mx340series_${pkgver}-1_i386.deb ${pkgdir}

  cd ${pkgdir}
  ar -x scangearmp-mx340series_${pkgver}-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx340series_${pkgver}-1_i386.deb
  rm data.tar.gz


  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
