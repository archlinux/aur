# Maintainer: Cody Schafer <dev at codyps.com>
pkgname=fuse-archive
pkgver=0.1.9
pkgrel=1
epoch=
pkgdesc="FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...)"
arch=(x86_64)
url="https://github.com/google/fuse-archive"
license=('Apache-2.0')
groups=()
depends=()
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
sha256sums=('22fb9df77583b36595d370b3d6151349b530ee45f3f9e278255cc020cefb0667')
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
