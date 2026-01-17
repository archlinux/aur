# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tsshd"
pkgver="0.1.6"
pkgrel=1
epoch=0
pkgdesc="trzsz-ssh(tssh) udp server that supports connection migration for roaming."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/ssh"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.25.3")
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
md5sums=('f1c838befa98ff5e5419a7d820e62152')
validpgpkeys=()

build() {
	cd "tsshd-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath"
	make
}

package() {
	cd "tsshd-$pkgver"
	make DESTDIR="$pkgdir" install
}
