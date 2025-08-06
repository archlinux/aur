# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=lib32-lindvd-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="LinDVD - The only official DVD player for Linux to legally unlock DVDs cucked with CSS for reading, from Mandriva Powerpack 2008 ISO"
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

# RPM is from an ISO named 'mandriva-linux-2008.0-pwp-dvd-x86_64.iso'
# Metadata of disc to more easily find it on the internet:
# https://disc-kuraudo.eu/dkm/pc-dvd-rom/linux/mandriva/mandriva.linux.2008.0.t2007.10.06.amd64.dvd5.dkm
source=("local://lindvd-${pkgver}-8mdv2008.0.i586.rpm")
sha256sums=('f1f185125217e07b658abd60cf5b806fd0d2e20d82be2e55fd67ec7f231b60f1')

package() {
	cp -rp ./usr "${pkgdir}"
	sed -i -e "s/ soundwrapper / /g" ${pkgdir}/usr/bin/lindvd
}
