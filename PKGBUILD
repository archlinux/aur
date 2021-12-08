# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=backman-git
_pkgname=backman

pkgver=0.4.0.gdf83968
pkgrel=1
pkgver() {
        cd "${_pkgname}"
        git describe --long --tags | sed -r 's/-/./g'
}
pkgdesc="Backman is a random/fixed background image setter for major GTK desktops, X11, sway and other wlroots based wayland compositors"
arch=("any")
url="https://github.com/securearth/backman"
license=('MIT')
depends=(
		"python>=3.5"
		"swaybg"
		"python-toml"
		"hsetroot"
        	"bash"
		)
makedepends=("git")
optdepends=()
provides=("backman")
conflicts=("backman")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/securearth/backman.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/backman/LICENSE"
	install -Dm755 backman "$pkgdir/usr/bin/backman"
	install -Dm755 set_xfce "$pkgdir/usr/share/backman/set_xfce"
	install -Dm 644 fix_bg.png "$pkgdir/usr/share/backman/fix_bg.png"
}
