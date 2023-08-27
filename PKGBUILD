# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=libsstv
pkgver=0.9.0
pkgrel=1
pkgdesc="SSTV encoder/decoder C library"
arch=('x86_64')
url="https://github.com/rimio/libsstv"
license=('MIT')
depends=('imagemagick' 'libsndfile')
makedepends=('cmake' 'gcc')
checkdepends=()
optdepends=()
backup=()
options=(staticlibs)
source=("https://github.com/rimio/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("6a5ee8b62757157429cc5d0cedf1ed61")

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
