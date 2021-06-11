# This utillity is for configuring coreboot options on Starlabs Labtop's running coreboot firmware.
# As this is an unofficial build script, StarLabsLtd is not responsible for this AUR build.

# Maintainer: Daniel Jongepier <djongepier@gmail.com>
pkgname=coreboot-configurator-git
_pkgname=coreboot-configurator
pkgver=6
pkgrel=2
pkgdesc="Graphical user interface to configure Starlabs Systems Labtop series"
arch=('i686' 'x86_64')
url="https://github.com/StarLabsLtd/coreboot-configurator"
license=('GPL3')
depends=("nvramtool-git" "qt5-base" "hicolor-icon-theme")
makedepends=("qt5-quickcontrols" "inkscape" "meson")
provides=("coreboot-configurator")
conflicts=("coreboot-configurator")
source=("https://github.com/StarLabsLtd/coreboot-configurator/archive/refs/tags/6.tar.gz")
sha256sums=("38145c73595dc86ae7a0d56abf0f3c86f51eaec2174af0df396371ef0494b21f")

build() {
	cd "$_pkgname-$pkgver"
	meson build
}

package() {
	cd "$_pkgname-$pkgver"
	ninja -C build install
}
