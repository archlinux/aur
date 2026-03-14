# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=plasma6-runners-markdown-bookmarks
pkgver=0.5.0
pkgrel=1
pkgdesc="A Krunner plugin to open web links listed in a Markdown file"
arch=('x86_64')
url=https://github.com/andrewrabert/krunner-markdown-bookmarks
license=(GLP3)
depends=(krunner)
makedepends=(cmake extra-cmake-modules ninja kcmutils)
source=("krunner-markdown-bookmarks.tar.gz")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('185e81490c7275044b81b2572e1e553c59015fec6faf38854b0386ccf014efdb')
install=plasma6-runners-markdown-bookmarks.install

build() {
	cmake \
        -B build \
        -G Ninja \
        -S "krunner-markdown-bookmarks-${pkgver}" \
		-Wno-dev \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
