# Maintainer: Piotr Żurek (phitherek@gmail.com)
pkgname=auto-display-manager-cr-git
pkgver=v.0.1.3.cr.r0.c1685b4
pkgrel=1
pkgdesc="A Crystal program for managing multiple screens (displays) via XRandR."
arch=('any')
url="https://gitlab.com/Phitherek_/auto-display-manager-cr"
license=('MIT')
groups=()
depends=('xorg-xrandr' 'libnotify')
makedepends=('git' 'crystal')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('auto-display-manager-cr::git+https://gitlab.com/Phitherek_/auto-display-manager-cr')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/auto-display-manager-cr"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/auto-display-manager-cr"
	./build.sh
}

package() {
	cd "$srcdir/auto-display-manager-cr"
	PREFIX="$pkgdir/usr" ./install.sh
}
