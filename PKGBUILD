# This utillity is for configuring coreboot options on Starlabs Labtop's running coreboot firmware.
# As this is an unofficial build script, StarLabsLtd is not responsible for this AUR build.

# Maintainer: Daniel Jongepier <djongepier@gmail.com>
pkgname=coreboot-configurator-git
_pkgname=coreboot-configurator
pkgver=1.2
pkgrel=1
pkgdesc="Graphical user interface to configure Starlabs Systems Labtop series"
arch=('i686' 'x86_64')
url="https://github.com/StarLabsLtd/coreboot-configurator"
license=('GPL3')
depends=("nvramtool-corevantage-git" "qt5-base" "hicolor-icon-theme")
makedepends=("qt5-quickcontrols" "inkscape" "meson")
provides=("coreboot-configurator")
conflicts=("coreboot-configurator")
source=("git+https://github.com/StarLabsLtd/coreboot-configurator.git")
sha256sums=("SKIP")

build() {
	cd "$_pkgname"
	meson build
}

package() {
	cd "$_pkgname"
	ninja -C build install
}
