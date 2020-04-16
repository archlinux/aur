# Maintainer: Ivor Uhliarik <ivor.uhliarik@gmail.com>
pkgname=srtmanip
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line tool to manipulate SRT subtitle files"
arch=('x86_64')
url="https://git.uhliarik.com/ivor/srtmanip"
license=('GPL3')
depends=(gcc-libs)
makedepends=(cmake)
source=("https://git.uhliarik.com/ivor/srtmanip/-/archive/v${pkgver}/srtmanip-v${pkgver}.tar.gz")
md5sums=('b725034fb452d1828bac9d00e6bddd24')
sha1sums=('9c7cda78b1a89541470deab455781edb79381852')
sha256sums=('c91fa48ea06e9f1ee88fa9fa79cf0fa89eea5c3314d5283db24e573b48f45e86')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" cmake --build build --target install
}
