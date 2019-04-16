# Maintainer: Ivor Uhliarik <ivor.uhliarik@gmail.com>
pkgname=srtmanip
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool to manipulate SRT subtitle files"
arch=('x86_64')
url="https://git.uhliarik.com/ivor/srtmanip"
license=('GPL3')
depends=(gcc-libs)
makedepends=(cmake)
source=("https://git.uhliarik.com/ivor/srtmanip/-/archive/v${pkgver}/srtmanip-v${pkgver}.tar.gz")
md5sums=('3e941a865ba12de5a3782053094dd366')
sha1sums=('389c77076b06016f81233ba629603292b96b49e6')
sha256sums=('2543a70161ff42652ddcc84a442dfb7f2d3659669824a06cbb1bf30b83f33469')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" cmake --build build --target install
}
