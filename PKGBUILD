pkgname=swingbench
pkgver=2.5.0.971
pkgrel=1
pkgdesc="An easy to use Oracle database load generator."
arch=('i686' 'x86_64')
url='http://dominicgiles.com/swingbench.html'
license=('custom')

depends=('java-runtime')

source=('http://dominicgiles.com/swingbench/swingbench25971.zip'
	'swingbench.desktop'
	'swingbench.png')

md5sums=('59b6618ea1d7d7f7160c884d4ac57f6f'
         'e7660576020ff5598cf7ecaa22bb1afa'
         '72ad891d515050504e1e0749041ec927')

package() {
	install -d ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share/icons
	
	mv ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}
	find ${pkgdir}/opt/${pkgname} -type f -exec chmod 644 {} \;
	find ${pkgdir}/opt/${pkgname}/bin -type f -exec chmod 755 {} \;
	find ${pkgdir}/opt/${pkgname} -type d -exec chmod 755 {} \;
	
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
