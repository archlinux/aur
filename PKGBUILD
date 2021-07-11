# Maintainer: Tom < tom at odex dot be >

pkgname=loxone-app
pkgver=12.1
pkgrel=3
pkgdesc="Desktop application for the loxone home automation system"
arch=( 'x86_64' )
depends=()
options=('!strip' '!emptydirs')
url="https://www.loxone.com/enen/support/downloads/"
license=('custom')

source=('https://updatefiles.loxone.com/linux/Release/121320210629-amd64.deb')
sha512sums=('96d1ef2db9a37376af2b275196e651ac49ef1f4818e3fe84e6043879d041f660b43f5bce690065cbb13c676f02a1e96feed8dd00fda5a3e6a9fbc0f3b48647a6')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	mkdir -p "${pkgdir}/usr/bin/"

	ln -s /opt/Loxone/kerberos "${pkgdir}/usr/bin/loxone"
}
