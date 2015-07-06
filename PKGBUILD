# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=efmb
pkgver=1.0
pkgrel=2
pkgdesc="Endless Forms Most Beautiful is a crazy platformer with braincrashing mechanics"
arch=('i686' 'x86_64')
url=('http://www.locomalito.com/efmb.php')
license=('CCPL')
depends=()
arch=('x86_64' 'i686')
source=('http://www.locomalito.com/juegos/EFMB_linux.zip'
	'efmb.png' 'efmb.desktop')
md5sums=('a286f67fab9d7ce041e5ce19fb71c40f'
         '70f0c70dc0d0263dbafcd747a9301ec5'
         '99dce59d073c2496e6ae5604fef74ef4')

package() {
	cd "${srcdir}/EFMB"
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "cd /opt/$pkgname/ && ./runner" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp * -r ${pkgdir}/opt/${pkgname}
	chmod -R 655  ${pkgdir}/opt/${pkgname}/runner
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/efmb.png"  ${pkgdir}/usr/share/icons
	install -m 644 "${srcdir}/efmb.desktop"  ${pkgdir}/usr/share/applications
}

