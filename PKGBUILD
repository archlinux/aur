# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tsshd"
pkgver="0.1.2"
pkgrel=1
epoch=0
pkgdesc="The tsshd works like mosh-server, while the 'tssh --udp' works like mosh."
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
md5sums=('82737dcb1d58abf38ff96ce0182b1383')
validpgpkeys=()

build() {
	cd "tsshd-$pkgver"
	make
}

package() {
	cd "tsshd-$pkgver"
	make DESTDIR="$pkgdir" install
}
