# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
_commit=2c3249a689cd
pkgname=zilf
pkgver=0.8
pkgrel=3
epoch=
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library."
arch=(any)
url="https://bitbucket.org/jmcgrew/zilf"
license=('GPL')
depends=('mono')
options=('!strip')
source=("https://bitbucket.org/jmcgrew/zilf/downloads/zilf-$pkgver.zip"
				"https://bitbucket.org/jmcgrew/zilf/get/$_commit.zip"
				"zapf.sh"
				"zilf.sh")
sha512sums=('15ac5054b64a7a9a1674a85a82d30d7599c446f5cdf47cebb9a48c5b0488ffd61d716b83754347ab79c789bab494e1271dd477e76f6cb47853a0958efbc8bfcf'
	  			  '4f506da0e7626dd1425110c9baf5dfc5cda52b86390c5c18012ea331ac1968703d6fc38d6ab75fa3ccb449a2093fdc868772f125671301a32f8d48f34c74ef13'
						'd32f99285b021a558315b0c334af7f764410fe0c14a76a684af8a8f741b10b2f1cf98642b7a127ad25a57881fd57802c7d5918d151bc0c831809df1b4a06870c'
	  			  'cfa4c5381eff3bc18840dd842260f803501dc0a584356b116e4f9b383a1b3a42ec8664e7fefac91df386cb611975b5250e56e6b69e5bbab0515947cc65103223')

package() {
	install -d -m 755 "${pkgdir}/usr/lib/zilf"
	install -d -m 755 "${pkgdir}/usr/lib/zilf/library"
	cp -dpr --no-preserve=ownership "${srcdir}/$pkgname-$pkgver/bin/"* "${pkgdir}/usr/lib/zilf"
	cp -dpr --no-preserve=ownership "${srcdir}/jmcgrew-zilf-$_commit/Library/"* "${pkgdir}/usr/lib/zilf/library/"
	install -D -m755 "${srcdir}/zilf.sh" "${pkgdir}/usr/bin/zilf"
	install -D -m755 "${srcdir}/zapf.sh" "${pkgdir}/usr/bin/zapf"
}
