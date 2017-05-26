# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=ntfs-3g-system-compression
pkgver=1.0
pkgrel=1
pkgdesc="NTFS-3G plugin for reading \"system compressed\" files"
arch=("i686" "x86_64")
url="https://github.com/ebiggers/ntfs-3g-system-compression"
license=("GPL2")
depends=("ntfs-3g")
source=("https://github.com/ebiggers/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("c4a26f3a704f5503ec1b3af5e4bb569590c6752616e68a3227fc717417efaaae")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 README.md "$pkgdir/usr/share/doc/ntfs-3g-system-compression/README.md"
}
