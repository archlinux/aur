# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=bleachbit-admin
pkgver=0.1
pkgrel=1
pkgdesc="Run BleachBit as root for cleaning system files."
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}" 'bleachbit-cli' 'bleachbit-root')
depends=('bleachbit' 'polkit' 'wmctrl' 'xdotool')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/linux-goodies/-/raw/master/run-as-root/bleachbit-admin/distrib/bleachbit-admin-0.1-1.tar.gz')

sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
