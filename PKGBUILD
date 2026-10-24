# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=catcodec
pkgver=1.1
pkgrel=1
pkgdesc="A tool for decoding/encoding .cat files for OpenTTD"
arch=('x86_64')
url="https://github.com/OpenTTD/catcodec"
license=('GPL')
makedepends=('cmake')
source=("https://github.com/OpenTTD/catcodec/releases/download/1.1/catcodec-1.1-source.tar.xz")
sha256sums=('24f0a634bcabf5f6fc88877b6abbb79686d86dfed0b2f1fb3955d2750d4a5fa6')
build() {
	cmake -B build -S "$pkgname-$pkgver" -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}
package() {
	DESTDIR="$pkgdir" cmake --install build
}
