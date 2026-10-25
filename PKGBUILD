# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tssh"
pkgver="0.1.27"
pkgrel=1
epoch=0
pkgdesc="Highly OpenSSH-compatible client with extended features"
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/tssh"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.26.0")
checkdepends=()
optdepends=()
provides=("tssh")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/trzsz/trzsz-ssh/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('b7086804dd6c726947dd1b831df5cce9')
validpgpkeys=()

build() {
	cd "trzsz-ssh-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath"
	make
}

package() {
	cd "trzsz-ssh-$pkgver"
	make DESTDIR="$pkgdir" install
}
