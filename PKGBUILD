# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
_pkgname=sway
pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='i3 compatible window manager for Wayland'
makedepends=("cmake")
depends=("wlc")
optdepends=("xorg-server-xwayland: running xorg windows under sway")
arch=("i386" "x86_64")
url='https://github.com/SirCmpwn/sway'
source=("${pkgname%-*}::git+https://github.com/SirCmpwn/sway.git")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" make install
}
