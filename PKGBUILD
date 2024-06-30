# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tsshd"
pkgver="0.1.1"
pkgrel=1
epoch=0
pkgdesc="The 'tssh --udp' works like 'mosh', and the 'tsshd' works like 'mosh-server'."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/ssh"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.21.11")
checkdepends=()
optdepends=()
provides=("tsshd")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/trzsz/tsshd/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('0c31fc6ae8e698bd4d8eb3b3904eae03')
validpgpkeys=()

build() {
	cd "tsshd-$pkgver"
	make
}

package() {
	cd "tsshd-$pkgver"
	make DESTDIR="$pkgdir" install
}
