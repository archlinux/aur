# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=specgram
pkgver=0.9.2
pkgrel=1
pkgdesc="Small program that computes and plots spectrograms, either in a live window or to disk, with support for stdin input."
arch=('x86_64')
url="https://github.com/rimio/specgram"
license=('MIT')
depends=('sfml' 'fftw')
makedepends=('cmake' 'gcc')
conflicts=('specgram-git')
source=("https://github.com/rimio/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("2f642bcf9b7bc13fa47afc52eae9f987")

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
