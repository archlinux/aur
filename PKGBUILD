# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgname=mew
pkgver=1.0
pkgrel=2
pkgdesc='Efficient dynamic menu for Wayland, an effective port of dmenu to Wayland'
arch=('x86_64')
url='https://codeberg.org/sewn/mew'
license=('MIT')
depends=(
	'fcft'
	'libxkbcommon'
	'pixman'
	'wayland'
)
makedepends=(
	'tllist'
	'wayland-protocols'
)
source=("https://codeberg.org/sewn/mew/archive/${pkgver}.tar.gz")
sha256sums=('01452fb92c6c5f792327ed8328bb2cbba55fa491260ccdf1b49db7960583c70b')

build() {
	cd "$pkgname"

	make
}

package() {
	cd "$pkgname"

	make PREFIX="${pkgdir}/usr" install
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
