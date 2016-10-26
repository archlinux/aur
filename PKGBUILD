# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Alomsimoy <alomsimoy@gmail.com>
# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>
# based in netbeans PKGBUILD

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=netbeans-es
pkgver=8.2
pkgrel=1
pkgdesc="Netbeans IDE development platform in Spanish"
url="http://www.netbeans.org"
arch=('any')
license=('CDDL')
conflicts=('netbeans')
provides=('netbeans')
depends=('java-environment')
source=('http://bits.netbeans.org/netbeans/8.2/community/zip/netbeans-8.2-201610071157.zip'
		'netbeans.desktop')
md5sums=('ded1adcdce2c2e8fe22919769370ff65'
         '954bdd8edfce8aaf93c82f260fb771ce')
install=netbeans.install
options=('!strip')

package() {
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/netbeans
	
	rm ${srcdir}/netbeans/bin/netbeans.exe
	install -D -m644 netbeans.desktop ${pkgdir}/usr/share/applications/netbeans.desktop
	cp -r ${srcdir}/netbeans/* ${pkgdir}/usr/share/netbeans/
	ln -s /usr/share/netbeans/bin/netbeans ${pkgdir}/usr/bin/netbeans
}


