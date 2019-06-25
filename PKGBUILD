# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-system76-power-git
pkgver=1.1.0.r2.gb02bf88
pkgrel=1
pkgdesc="Gnome shell extension for System76 power management"
arch=('any')
url="https://github.com/pop-os/gnome-shell-extension-system76-power"
license=('MIT')
depends=('gnome-shell' 'system76-power')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/pop-os/gnome-shell-extension-system76-power.git#branch=master_disco")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
