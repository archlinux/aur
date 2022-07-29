# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="FUSE file system for ZIP archives"
arch=(x86_64)
url="https://github.com/google/mount-zip"
license=('GPL3')
depends=('boost-libs' 'icu' 'fuse2>=2.7' 'libzip>=1.0')
makedepends=('boost' 'make' 'pandoc' 'pkgconf')
source=("https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2882e32175f5dee68ed9243b1e8b66966584af6223795c2169d3b43c39783f3d')

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

