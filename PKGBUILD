# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="trzsz"
pkgver="0.1.9"
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
md5sums=('599a07a37d125058c867dd4afd8ea379')
validpgpkeys=()

build() {
	cd "$pkgname-go-$pkgver"
	make
}

package() {
	cd "$pkgname-go-$pkgver"
	make DESTDIR="$pkgdir" install
}
