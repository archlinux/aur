# Maintainer: Leo <i@setuid0.dev>
pkgname=qbittorrent-enhanced
pkgver=5.0.0.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar' 'openssl' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme' 'zlib')
makedepends=('cmake' 'boost>=1.65' 'qt6-tools')
checkdepends=()
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
replaces=()
backup=()
options=()
install=
changelog=
source=("qbittorrent-enhanced-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz")
noextract=()
sha256sums=('86529633c8036a7d3c791b50dcb8683ac103711c1a8c0c414ee8f1beb61d9d71')

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
