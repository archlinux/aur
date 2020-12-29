# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=specgram-git
pkgver=20201229
pkgrel=1
pkgdesc="Small program that computes and plots spectrograms, either in a live window or to disk, with support for stdin input."
arch=('x86_64')
url="https://github.com/rimio/specgram"
license=('MIT')
depends=('sfml' 'spdlog' 'fftw')
makedepends=('git' 'cmake' 'gcc')
conflicts=('specgram')
source=("git+https://github.com/rimio/specgram.git")
md5sums=('SKIP')

build() {
	cd specgram
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd specgram
	make DESTDIR="$pkgdir/" install
}
