# Maintainer: Cody Schafer <dev at codyps.com>
pkgname=fuse-archive
pkgver=0.1.14
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
sha256sums=('d39d2d265fcadf729b306b293df3407d11140e1b0476bc77e138915d2f0e8c07')
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
