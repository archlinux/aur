# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=gbctc-git
pkgver=r5.1f4d783
pkgrel=1
pkgdesc="A simple utility to convert an image into Game Boy Color tile data"
arch=("x86_64")
url="https://github.com/philj56/gbc-tile-convert"
license=("MIT")
groups=()
depends=("libpng")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
        make
}

package() {
	cd "${pkgname}"
        DESTDIR="$pkgdir" make install
}
