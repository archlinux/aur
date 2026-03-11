# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=plasma6-runners-markdown-bookmarks
pkgver=0.2.0
pkgrel=1
pkgdesc="A Krunner plugin to open web links listed in a Markdown file"
arch=('x86_64')
url=https://github.com/andrewrabert/krunner-markdown-bookmarks
license=(GLP3)
depends=(krunner)
makedepends=(cmake extra-cmake-modules kcmutils)
source=("krunner-markdown-bookmarks.tar.gz")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7cad86c88d5d8f79de355de3edf10dbde9857e8d0da912ca1116d65cd8c15234')
install=plasma6-runners-markdown-bookmarks.install

build() {
	cmake -B build -S "krunner-markdown-bookmarks-${pkgver}" \
		-Wno-dev \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
