# Maintainer: Cody Schafer <dev at codyps.com>
pkgname=fuse-archive
pkgver=0.1.11
pkgrel=1
epoch=
pkgdesc="FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...)"
arch=(x86_64)
url="https://github.com/google/fuse-archive"
license=('Apache-2.0')
groups=()
depends=(fuse2)
makedepends=()
checkdepends=(go)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/fuse-archive/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('1ca30ec5064fccc3329adf821689dfd3190517d7555e6c8eba6f62f2b011e8bc')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
