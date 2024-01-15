pkgname=swingbench
pkgver=2.7.0.1430
pkgrel=1
pkgdesc="An easy to use Oracle database load generator."
arch=('i686' 'x86_64')
url='http://dominicgiles.com/swingbench.html'
license=('custom')

depends=('java-runtime')

source=('https://www.dominicgiles.com/site_downloads/swingbench04112023_jdk11.zip'
	'swingbench.desktop'
	'swingbench.png')

package() {
	install -d ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share/icons
	
	mv ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}
	#find ${pkgdir}/opt/${pkgname} -type f -exec chmod 644 {} \;
	#find ${pkgdir}/opt/${pkgname}/bin -type f -exec chmod 755 {} \;
	#find ${pkgdir}/opt/${pkgname} -type d -exec chmod 755 {} \;
	
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
sha256sums=('9b35e748eff7ec71e34bdbb0c9569dbffc0a94fcb23bc7fda6c8399301afa09c'
            '073a6fe7970a2116465e03e1868bc9dea282f0a8c33e559f4f098081d43763ee'
            'ee2ef6ce1417413e1686049f534ba2dab9ef2f99f6ca461668408c75cf8cd844')
