# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=lindvd
pkgver=1.2.6
pkgrel=2
pkgdesc="LinDVD - Actually an official DVD player for Linux from Mandriva Powerpack 2008 ISO"
arch=('x86_64' 'i686')
license=('custom')
url='https://web.archive.org/web/20080123102609/http://www.intervideo.com/jsp/Product_Profile.jsp?p=LinDVD'
depends=(
	'lib32-libstdc++5'
	'lib32-libxcrypt-compat'
	'lib32-libxinerama'
)
install=${pkgname}.install
provides=('lindvd')
conflicts=('lindvd')
source=("local://${pkgname}-${pkgver}-8mdv2008.0.i586.rpm")
sha256sums=('f1f185125217e07b658abd60cf5b806fd0d2e20d82be2e55fd67ec7f231b60f1')

package() {
	cp -rp ./usr "${pkgdir}"
	sed -i -e "s/ soundwrapper / /g" ${pkgdir}/usr/bin/lindvd
}
