# Maintainer: maz-1 <loveayawaka at gmail dot com>
pkgname=imewlconverter
pkgver=2.1.1
pkgrel=1
pkgdesc="An ime word library converter support more than 20 ime tools."
arch=('any')
url="https://github.com/studyzy/imewlconverter"
license=('GPL2')
depends=('mono')
source=("imewlconverter.exe::https://github.com/maz-1/imewlconverter/raw/master/IME%20WL%20Converter/IME%20WL%20Converter/bin/Release/ime.exe" 
	"imewlconverter.desktop"
	"imewlconverter.png")
md5sums=('3dacc38b3639c46a3d38a53a6ead7229'
	'62a3f04c61d0466b8f82fb40257ed40f'
	'c337edefb46e2f5124748cc9c0078872')


package() {
	install -dm 755 ${pkgdir}/usr/{bin,share/imewlconverter,share/applications}
	cd $srcdir
	install -Dm 644 imewlconverter.exe ${pkgdir}/usr/share/imewlconverter/imewlconverter.exe
	install -Dm 644 imewlconverter.png ${pkgdir}/usr/share/pixmaps/imewlconverter.png
	#install -m 644 imewlconverter.jpg ${pkgdir}/usr/share/icons/imewlconverter.jpg
        echo '#!/bin/sh' > ${pkgdir}/usr/bin/imewlconverter
	echo 'exec mono /usr/share/imewlconverter/imewlconverter.exe "$@"' >> ${pkgdir}/usr/bin/imewlconverter
	chmod +x ${pkgdir}/usr/bin/imewlconverter
	install -Dm 644 ${srcdir}/imewlconverter.desktop ${pkgdir}/usr/share/applications/imewlconverter.desktop
}
