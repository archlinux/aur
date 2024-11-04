# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=sysboard
pkgver=9.9.9
pkgrel=9
pkgdesc="Simple virtual keyboard for wayland"
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/sysboard"
license=('WTFPL')
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/sysboard")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git show -s --format=%cd --date=format:%Y.%m.%d $(git rev-parse HEAD)
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
