# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="trzsz"
pkgver="1.1.1"
pkgrel=1
epoch=0
pkgdesc="Simple file transfer tools, similar to lrzsz (rz/sz), and compatible with tmux."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.20.3")
checkdepends=()
optdepends=()
provides=("trz" "tsz" "trzsz")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/trzsz/trzsz-go/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('b31bd276248297efd0b9c011b4c90e77')
validpgpkeys=()

build() {
	cd "trzsz-go-$pkgver"
	make
}

package() {
	cd "trzsz-go-$pkgver"
	make DESTDIR="$pkgdir" install
}
