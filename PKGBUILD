# Maintainer: Arian-D
pkgname=dwl-guile-git
pkgdesc="Dynamic tiling Wayland compositor configurable in Guile Scheme, based on dwl and libguile - now with a REPL!"
pkgver=2.0.1
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/engstrand-config/dwl-guile"
license=('GPL')
depends=('wlroots>=0.16')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("git+https://github.com/engstrand-config/dwl-guile")
sha256sums=('SKIP')

build() {
	# Uncomment to compile with XWayland support
	# sed -i -e '/-DXWAYLAND/s/^#//' config.mk
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/" install
}