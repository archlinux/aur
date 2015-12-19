# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=udev-joystick-blacklist
pkgver=r24.b687663
pkgrel=1
pkgdesc="Fix for keyboard/mouse/tablet being detected as joystick."
url="https://github.com/denilsonsa/udev-joystick-blacklist"
arch=('x86_64' 'i686')
license=('GPLv3')

source=("git+https://github.com/denilsonsa/udev-joystick-blacklist.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "${srcdir}"/${pkgname}/51-these-are-not-joysticks-rm.rules "${pkgdir}"/etc/udev/rules.d/51-these-are-not-joysticks-rm.rules
	## Alternatively, if you don't want to remove the erroneous
	## devices but set their permissions to 0000, comment the above
	## line and uncomment the one below
	#install -Dm644 "${srcdir}/${pkgname}"/51-these-are-not-joysticks.rules "${pkgdir}"/etc/udev/rules.d/51-these-are-not-joysticks.rules
}
