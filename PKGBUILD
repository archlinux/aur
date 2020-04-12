# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cppglob
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="C++ port of Python glob module"
arch=('x86_64')
url="https://github.com/Kogia-sima/cppglob"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=("lib$pkgname.so")
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("8baedb70e9a56d3eb99510d6a6cb4863bfeaa89069b5a2970ba6817201821552")

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
