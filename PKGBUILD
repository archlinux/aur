# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgname=mew
pkgver=1.0
pkgrel=4
pkgdesc='Efficient dynamic menu for Wayland, an effective port of dmenu to Wayland'
arch=('x86_64')
url='https://codeberg.org/sewn/mew'
license=('MIT')
depends=(
	'fcft'
	'glibc'
	'libxkbcommon'
	'pixman'
	'sh'
	'wayland'
)
makedepends=(
	'tllist'
	'wayland-protocols'
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/sewn/mew/archive/${pkgver}.tar.gz")
sha256sums=('9076073b1973330563b344034f152b855f3936ecebb1ad849ae5f3deb8fa5e0a')

build() {
	cd "$pkgname"

	make
}

package() {
	cd "$pkgname"

	make PREFIX="${pkgdir}/usr" install
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
