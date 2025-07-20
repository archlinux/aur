pkgname=soundfont-gmgsx
pkgver=2.9.1.0
pkgrel=1
pkgdesc="Soundfont by Kenneth Rundt which has similar sound as gm.dls"
arch=('any')
license=('LicenseRef-SynthFont')
url="http://www.synthfont.com"
makedepends=('innoextract')
source=("${pkgver}.exe::${url}/SynthFont2x64Setup.exe")
sha256sums=('979b50c029cc9e9cf9bce97bab2eaf14cece835d770f8914be8ee1383eb51f41')

prepare(){
  innoextract -I app/GMGSx.sf2 ${pkgver}.exe -I app/License2.txt
}

package(){
  install -Dm644 app/GMGSx.sf2 "${pkgdir}/usr/share/soundfonts/GMGSx.sf2"
  install -Dm644 app/License2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
