# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.0.12
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
sha256sums=('78076e1b8a9072d87e5384310488ebbdd56625a3a0c54447eac0377572cb302a')

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

