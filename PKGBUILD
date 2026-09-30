# Maintainer: ItsZariep <itszariep@disroot.org>
pkgname=nbtui-git
pkgver=r9.a889fb0
pkgrel=1
pkgdesc="Ncurses Bluetooth TUI manager"
arch=('any')
url="https://codeberg.org/ItsZariep/nbtui"
license=('GPL-3.0-only')
depends=('bluez' 'ncurses')
makedepends=('git' 'make')
source=("${pkgname}::git+https://codeberg.org/ItsZariep/nbtui.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}" PREFIX=/usr
}
