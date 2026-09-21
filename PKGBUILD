# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=img2ascii-git
pkgver=r69.4a233e1
pkgrel=1
pkgdesc="Convert images to ASCII art"
arch=('x86_64')
url="https://github.com/JosefVesely/Image-to-ASCII"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('img2ascii')
conflicts=('img2ascii')
source=("img2ascii::git+https://github.com/JosefVesely/Image-to-ASCII.git")
sha256sums=('SKIP')
function pkgver() {
	cd img2ascii
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function build() {
	cd img2ascii
	make
}
function package() {
	cd img2ascii
	install -Dm755 img2ascii "$pkgdir/usr/bin/img2ascii"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
