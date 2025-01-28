# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=frogfm
pkgver=9.9.9
pkgrel=9
pkgdesc="Sleek file manager written in gtkmm 4"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/frog"
license=('WTFPL')
depends=('gtkmm-4.0' 'gtk4-layer-shell' 'gstreamer' 'xdg-utils')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/System64fumo/frog")
sha256sums=('SKIP')

pkgver() {
	cd "frog"
	git show -s --format=%cd --date=format:%Y.%m.%d $(git rev-parse HEAD)
}

build() {
	cd "frog"
	make
}

package() {
	cd "frog"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
