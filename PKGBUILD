pkgname=soundfont-gmgsx
pkgver=2.9.2.2
pkgrel=1
pkgdesc="Soundfont by Kenneth Rundt which has similar sound as gm.dls"
arch=('any')
license=('LicenseRef-SynthFont')
url="http://www.synthfont.com"
makedepends=(innex)
source=("${pkgname}${pkgver}.exe::${url}/SynthFont2x64Setup.exe")
b2sums=('05911249d5e1e870432b0fc76b3f9af14c34dc9505a35f3e05fcd22bc3631f4e0f44cc65cc66c1873816bbb80e661faec70f0852000a3ee077e7dc189d2904f1')

prepare(){
  innex -f GMGSx.sf2 -e out ${source[0]%::*}
  innex -f License2.txt -e out ${source[0]%::*}
}

package(){
  install -Dm644 out/GMGSx.sf2 -t "${pkgdir}/usr/share/soundfonts/GMGSx.sf2"
  install -Dm644 out/License2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
