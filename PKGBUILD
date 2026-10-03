# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tsshd"
pkgver="0.1.10"
pkgrel=1
epoch=0
pkgdesc="UDP-based SSH server with seamless roaming and auto-reconnect"
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/tsshd"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.26.0")
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
md5sums=('618cc4c9f7a81bba44dbc6d2256bf8dd')
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
