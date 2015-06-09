# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: dale mallion <dale dot mallion at gmail dot com>

pkgname="mac-os-lion-cursors"
pkgver=2.0
pkgrel=2
pkgdesc="MAC OS X Lion Cursor Theme by MB0SS"
arch=('i686' 'x86_64')
url="http://mbossg.deviantart.com/#/d4yqyle"
license=('GPL3')
source=("https://launchpadlibrarian.net/107244851/${pkgname}-v2_2.0~quantal.tar.gz")
sha256sums=('2bcc4319539e1f828a8663269cdc46ec867d276f9670a44e27ecabb9f18340a2')

build() {
	cd "${srcdir}/cursors"
	rm -rf ./debian
	rm ./mac-aqua-cursor/{'Install Mac-Aqua','Mac OS X Cursor Pack For Ubuntu By MB0SS.png','Read-Me','uninstall Mac-Aqua'}
	rm ./mac-aqua-swirl-cursor/{'Install Mac-Aqua-Swirl','Mac OS X Cursor Pack For Ubuntu By MB0SS.png','Read-Me','uninstall Mac-Aqua-Swirl'}
	rm ./mac-pak-cursor/{'Install Mac-Pak','Mac OS X Cursor Pack For Ubuntu By MB0SS.png','Read-Me','uninstall Mac-Pak'}
	rm ./mac-radioactive-cursor/{'Install Mac-Radioactive','Mac OS X Cursor Pack For Ubuntu By MB0SS.png','Read-Me','uninstall Mac-Radioactive'}
	rm ./mac-rainbow-cursor/{'Install Mac-Rainbow','Mac OS X Cursor Pack For Ubuntu By MB0SS.png','Read-Me','uninstall Mac-Rainbow'}
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/icons"
	cp -rf ./cursors/* "${pkgdir}/usr/share/icons/"
	chmod 755 -R "${pkgdir}/usr/share/icons"
}

# vim:set ts=4 sw=2 ft=sh et: