# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=specgram
pkgver=0.9.0
pkgrel=2
pkgdesc="Small program that computes and plots spectrograms, either in a live window or to disk, with support for stdin input."
arch=('x86_64')
url="https://github.com/rimio/specgram"
license=('MIT')
depends=('sfml' 'spdlog' 'fftw')
makedepends=('cmake' 'gcc')
conflicts=('specgram-git')
source=("https://github.com/rimio/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("087db9205c755d7b73fdc10abcb9e226")

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
