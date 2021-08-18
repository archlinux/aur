# This utillity is for configuring coreboot options on Starlabs Labtop's running coreboot firmware.
# As this is an unofficial build script, StarLabsLtd is not responsible for this AUR build.

# Maintainer: Daniel Jongepier <djongepier@gmail.com>
pkgname=coreboot-configurator-git
_pkgname=coreboot-configurator
pkgver=6.f
pkgrel=3
pkgdesc="Graphical user interface to configure Starlabs Systems Labtop series"
arch=('i686' 'x86_64')
url="https://github.com/StarLabsLtd/coreboot-configurator"
license=('GPL3')
depends=("nvramtool-git" "qt5-base" "hicolor-icon-theme")
makedepends=("qt5-quickcontrols" "inkscape" "meson")
provides=("coreboot-configurator")
conflicts=("coreboot-configurator")
source=("https://github.com/StarLabsLtd/coreboot-configurator/archive/refs/tags/6.f.tar.gz")
sha256sums=("c82d282d45d120421e7045f68afd596679a610f07aaf72f473a80216d01f7a6b")

build() {
	cd "$_pkgname-$pkgver"
	meson build
}

package() {
	cd "$_pkgname-$pkgver"
	ninja -C build install
}
