# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.0.9
pkgrel=1
epoch=
pkgdesc="FUSE file system for ZIP archives"
arch=(x86_64)
url="https://github.com/google/mount-zip"
license=('GPL3')
depends=('boost-libs' 'icu' 'fuse2>=2.7' 'libzip>=1.0')
makedepends=('boost' 'make' 'pandoc' 'pkgconf')
checkdepends=('python')
source=("https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c03b798bb6334854153b6f8d3d77165b8dc63abef486405ede37623bcbe81c8')

build() {
	cd "$pkgname-$pkgver"
	make all $pkgname.1
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

