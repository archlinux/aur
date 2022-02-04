pkgname=pure-maps
pkgver=2.7.5
pkgrel=1
arch=("x86_64" "aarch64")
source=("https://github.com/rinigus/pure-maps/releases/download/$pkgver/pure-maps-$pkgver.tar.gz")
sha256sums=("8e65521d30a1b5e627d72138e77227cdc40d10fdad1d056ccb1a56522201372e")
depends=("s2geometry" "python3" "qt5-base" "qt5-location" "qt5-declarative" "qt5-quickcontrols2" "nemo-qml-plugin-dbus" "python-pyotherside" "mapbox-gl-qml")

build() {
	cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
