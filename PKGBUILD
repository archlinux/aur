# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tssh"
pkgver="0.1.24"
pkgrel=1
epoch=0
pkgdesc="Alternative ssh client with additional features to meet your needs."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/ssh"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.25.3")
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
md5sums=('f461be6f9840c5718d1df4ce048a112b')
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
