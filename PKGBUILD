# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.0.14
pkgrel=1
epoch=
pkgdesc="FUSE file system for ZIP archives"
arch=(x86_64)
url="https://github.com/google/mount-zip"
license=('GPL3')
depends=('boost-libs' 'icu' 'fuse2>=2.7' 'libzip>=1.0')
makedepends=('boost' 'make' 'pkgconf')
checkdepends=('python')
source=("https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bab33f4b7a4ed3f5d589a7b1cd5677200e528447d039d462c7c8d9bde391c507')

build() {
	cd "$pkgname-$pkgver"
	make all
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

