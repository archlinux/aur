# Maintainer: Joel Eapen <joelpeapen@gmail.com>
pkgname='pickled-git'
_pkgname='pickled'
pkgver=r2.3edefe3
pkgrel=1
pkgdesc="lightweight colorpicker"
arch=("x86_64")
license=('GPL-3.0')
makedepends=('git' 'wayland' 'libxkbcommon' 'freetype2' 'libffi' 'zlib' 'bzip2' 'libpng' 'brotli')
depends=('glibc' 'wayland' 'libxkbcommon' 'freetype2')
optdepends=('hyprpicker')
url="https://codeberg.org/j_ole/$_pkgname"
source=("$_pkgname::git+https://codeberg.org/j_ole/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir"
}
