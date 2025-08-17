# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=plasma6-runners-markdown-bookmarks
pkgver=0.1.0
pkgrel=1
pkgdesc="A Krunner plugin to open web links listed in a Markdown file"
arch=('x86_64')
url=https://github.com/andrewrabert/krunner-markdown-bookmarks
license=(GLP3)
depends=(krunner)
makedepends=(cmake extra-cmake-modules kcmutils)
source=("krunner-markdown-bookmarks.tar.gz")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('328d5c202ae42ca1b73763021bb89895b11551845c60f62db55bdb79403f61d9')
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
