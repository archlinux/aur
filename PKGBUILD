# Maintainer: Leo <i@setuid0.dev>
pkgname=qbittorrent-enhanced
pkgver=5.0.4.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later')
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
sha256sums=('19f7f8e7cffbc81bee3da3cdfe72b3171d61a4f48078a5a12a9c0df12b0726e5')

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
