# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-system76-power-git
pkgver=2.0.5.r0.g1f055fc
pkgrel=1
pkgdesc="Gnome shell extension for System76 power management"
arch=('any')
url="https://github.com/pop-os/gnome-shell-extension-system76-power"
license=('MIT')
depends=('gnome-shell' 'system76-power')
makedepends=('git' 'make' 'typescript')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build(){
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}"
}


package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
