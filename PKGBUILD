# Maintainer: Tom < tom at odex dot be >

pkgname=loxone-app
pkgver=12.2.7
pkgrel=1
pkgdesc="Desktop application for the loxone home automation system"
arch=( 'x86_64' )
depends=()
options=('!strip' '!emptydirs')
url="https://www.loxone.com/enen/support/downloads/"
license=('custom')

source=('https://updatefiles.loxone.com/linux/Release/12242021123-amd64.deb')
sha512sums=('5aa52d3a57b14800dcebfb76ea1ed28f58002c406eae205977c1bb6b2553a0364c7be81941634fc2801ff0f78d85df0d1c65f806b13b4bf049bcdcc56e3c7edb')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	mkdir -p "${pkgdir}/usr/bin/"

	ln -s /opt/Loxone/kerberos "${pkgdir}/usr/bin/loxone"
}
