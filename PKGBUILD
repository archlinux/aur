# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Past maintainer: Max Roder <maxroder@web.de>

pkgname='wpscrack'
pkgver='0.0.1'
pkgrel='4'
pkgdesc='Prove of concept tool to brute force WPS - external registrar PIN of wlan access points'
url='http://sviehb.wordpress.com'
arch=('i686' 'x86_64')
license=('unknown')
depends=('pycrypto' 'scapy')
source=("http://dl.dropbox.com/u/22108808/${pkgname}.zip")
sha512sums=('1b007222463103eb66fbf345b2244371d983d91129e893b668062c2e41cdb3cdec7386f3ff5a980e18e00b300486cf3e6a50070643719373029f106e95bb7ba1')

package() {
	cd ${srcdir}

	sed -i 's/python/python2/g' wpscrack.py

	install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -Dm755 wpscrack.py ${pkgdir}/usr/bin/wpscrack
}

