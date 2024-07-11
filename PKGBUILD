# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=sysbar
pkgver=0.1
pkgrel=1
pkgdesc="Modular status bar for wayland"
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/sysbar"
license=('WTFPL')
depends=('gtkmm-4.0' 'gtk4-layer-shell' 'nlohmann-json' 'upower')
packager="System64 <system64fumo@protonmail.com>"
source=("git+https://github.com/System64fumo/sysbar")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	mkdir "${pkgdir}/usr"
	make DESTDIR="${pkgdir}/usr" install
}
