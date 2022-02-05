pkgname=mapbox-gl-qml
pkgver=1.7.7
pkgrel=2
arch=("x86_64" "aarch64")
source=("https://github.com/rinigus/mapbox-gl-qml/archive/refs/tags/1.7.7.tar.gz")
sha256sums=("a5cd3e773b6635dc0f7ad0490857a44177e8c619a47800707fb1927f1a169c7e")
depends=("mapbox-gl-native" "qt5-location")
license=("LGPL3")

build() {
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_LIBDIR=lib -DUSE_CURL_SSL=OFF
	cmake --build build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
