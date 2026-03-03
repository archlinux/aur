# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.12
pkgrel=1
epoch=
pkgdesc="FUSE file system for ZIP archives"
arch=(x86_64)
url="https://github.com/google/mount-zip"
license=('GPL3')
depends=('boost-libs' 'icu' 'fuse3>=3.1' 'libzip>=1.0')
makedepends=('boost' 'make' 'pkgconf')
checkdepends=('python')
source=("https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c01a0fca5b5a3aeadcd255ef44ac6c81ce881beb5b9b269f9a4c8aa3dcf900ec')

build() {
	cd "$pkgname-$pkgver"
	FUSE_MAJOR_VERSION=3 make all
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

