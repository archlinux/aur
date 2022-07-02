# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="trzsz"
pkgver="0.1.8"
pkgrel=1
epoch=0
pkgdesc="Simple file transfer tools, similar to lrzsz (rz/sz), and compatible with tmux."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.18.0")
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
md5sums=("7ee6e9dcbb1090fb318ea426bffbcfb0")
validpgpkeys=()

build() {
	cd "$pkgname-go-$pkgver"
	make
}

package() {
	cd "$pkgname-go-$pkgver"
	make DESTDIR="$pkgdir" install
}
