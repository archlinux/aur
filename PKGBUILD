pkgname=soundfont-gmgsx
pkgver=2.9.1.1
pkgrel=1
pkgdesc="Soundfont by Kenneth Rundt which has similar sound as gm.dls"
arch=('any')
license=('LicenseRef-SynthFont')
url="http://www.synthfont.com"
makedepends=('innoextract')
source=("${pkgname}${pkgver}.exe::${url}/SynthFont2x64Setup.exe")
sha256sums=('SKIP') # unstable hashsum with same URL

prepare(){
  innoextract ${source[0]%::*} -I app/GMGSx.sf2 -I app/License2.txt
}

package(){
  install -Dm644 app/GMGSx.sf2 "${pkgdir}/usr/share/soundfonts/GMGSx.sf2"
  install -Dm644 app/License2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
