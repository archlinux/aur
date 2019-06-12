# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
_commit=27ad7d9cf7af
pkgname=zilf
pkgver=0.8
pkgrel=5
epoch=
pkgdesc="Tools for working with the ZIL fiction language, including a compiler and assembler"
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
            '7a663b95d93cf4cd8d426d1a9b94592ecbf02c1e4f91eed97bfdae0be28bbe8ba5efbb4e34939a356cb9a8b3d2fab91bff0c354ce902c80ff521117833d828ff'
            'd32f99285b021a558315b0c334af7f764410fe0c14a76a684af8a8f741b10b2f1cf98642b7a127ad25a57881fd57802c7d5918d151bc0c831809df1b4a06870c'
            'cfa4c5381eff3bc18840dd842260f803501dc0a584356b116e4f9b383a1b3a42ec8664e7fefac91df386cb611975b5250e56e6b69e5bbab0515947cc65103223')

package() {
	install -d -m 755 "${pkgdir}/usr/lib/zilf"
	install -d -m 755 "${pkgdir}/usr/lib/zilf/library"
	cp -dpr --no-preserve=ownership "${srcdir}/$pkgname-$pkgver/bin/"* "${pkgdir}/usr/lib/zilf"
	cp -dpr --no-preserve=ownership "${srcdir}/jmcgrew-zilf-$_commit/zillib/"* "${pkgdir}/usr/lib/zilf/library/"
	chmod ugo+x "${pkgdir}/usr/lib/zilf/zilf.exe"
	chmod ugo+x "${pkgdir}/usr/lib/zilf/zapf.exe"
	install -D -m 755 "${srcdir}/zilf.sh" "${pkgdir}/usr/bin/zilf"
	install -D -m 755 "${srcdir}/zapf.sh" "${pkgdir}/usr/bin/zapf"
}
