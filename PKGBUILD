# Maintainer: maz-1 <loveayawaka at gmail dot com>
pkgname=imewlconverter
pkgver=2.1.1
pkgrel=1
pkgdesc="An ime word library converter support more than 20 ime tools."
arch=('any')
url="https://github.com/studyzy/imewlconverter"
license=('GPL2')
depends=('mono')
source=("imewlconverter.exe::https://github.com/maz-1/imewlconverter/raw/master/IME%20WL%20Converter/IME%20WL%20Converter/bin/Release/%E6%B7%B1%E8%93%9D%E8%AF%8D%E5%BA%93%E8%BD%AC%E6%8D%A2.exe" 
		
	"imewlconverter.desktop")
md5sums=('a070d839126ea409a1a86c9d18354419'
	'5da2dc22d769bbea260ae8af0b546615')


package() {
	install -dm 755 ${pkgdir}/usr/{bin,share/imewlconverter,share/applications}
	cd $srcdir
	install -m 644 imewlconverter.exe ${pkgdir}/usr/share/imewlconverter/imewlconverter.exe
	#install -m 644 imewlconverter.jpg ${pkgdir}/usr/share/icons/imewlconverter.jpg
        echo '#!/bin/sh' > ${pkgdir}/usr/bin/imewlconverter
	echo 'exec mono /usr/share/imewlconverter/imewlconverter.exe "$@"' >> ${pkgdir}/usr/bin/imewlconverter
	chmod +x ${pkgdir}/usr/bin/imewlconverter
	install -Dm 644 ${srcdir}/imewlconverter.desktop ${pkgdir}/usr/share/applications/imewlconverter.desktop
}
