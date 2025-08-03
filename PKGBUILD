# Maintainer: Sam Chan <shaughn.chan@gmail.com>
pkgname=grim-hyprland-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Fork of grim for Hyprland specific protocols'
arch=(x86_64)
url=https://github.com/eriedaberrie/grim-hyprland
license=(MIT)
depends=(
	wayland
	pixman
	libpng
)
makedepends=(
	git
	meson
)
optdepends=('libjpeg: JPEG support')
conflicts=(grim)
provides=(grim)
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

build() {
	arch-meson --buildtype=release -Dwerror=false ${pkgname} build
	meson compile -C build
}

package() {
	meson install -C build --destdir="${pkgdir}"
}
