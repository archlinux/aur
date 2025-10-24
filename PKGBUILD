# Maintainer: system64 <system64fumo@tuta.io>

pkgname=syspower
pkgver=9.9.9
pkgrel=9
pkgdesc="Simple power menu/shutdown screen"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/syspower"
license=('GPL3')
groups=('sysshell')
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/syspower")
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
