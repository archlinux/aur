pkgname=soundfont-gmgsx
pkgver=2.9.0.3
pkgrel=3
pkgdesc="Soundfont by Kenneth Rundt which has similar sound as gm.dls"
arch=('any')
license=('LicenseRef-SynthFont')
url="http://www.synthfont.com"
makedepends=('innoextract')
source=("${url}/SynthFont2x64Setup.exe")
sha256sums=('99209e856544af86e52c44dba6e8f6572d72cfb81453f103c204530794989dcc')

prepare(){
	innoextract -I app/GMGSx.sf2 SynthFont2x64Setup.exe -I app/License2.txt
}

package(){
	install -Dm644 app/GMGSx.sf2 "${pkgdir}/usr/share/soundfonts/GMGSx.sf2"
	#set default font for fluidsynth
	ln -sv /usr/share/soundfonts/GMGSx.sf2 ${pkgdir}/usr/share/soundfonts/default.sf2
	install -Dm644 app/License2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
