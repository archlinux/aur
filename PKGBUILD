# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=libecbor
pkgver=1.0.3
pkgrel=1
pkgdesc="CBOR library for desktop and embedded applications"
arch=('x86_64')
url="https://github.com/rimio/libecbor"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc')
checkdepends=()
optdepends=()
backup=()
options=(staticlibs)
source=("https://github.com/rimio/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("66e2a95200c581489326b2128f64ae17")

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
