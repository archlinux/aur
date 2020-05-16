# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=zd1211-firmware
pkgver=1.5
pkgrel=4
pkgdesc='Firmware for the in-kernel zd1211rw wireless driver'
arch=('any')
url='https://sourceforge.net/projects/zd1211'
license=('GPL2')
provides=('zd1211')
source=("https://downloads.sourceforge.net/zd1211/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f11d3810d7f72833997f634584a586dcced71a353f965abf81062ec431d02b12')

package() {
	cd ${srcdir}/${pkgname}
	# Install firmware
	for i in zd1211*
	do
		install -D -m 644 ${i} ${pkgdir}/usr/lib/firmware/zd1211/${i}
	done
}
