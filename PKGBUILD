# Maintainer: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=kwin-gestures
pkgver=0.2.0
pkgrel=1
pkgdesc="Custom touchpad gestures for KDE Plasma 6"
arch=('x86_64')
url="https://github.com/taj-ny/kwin-gestures"
license=('GPL-3.0-only')
depends=('kwin')
makedepends=('extra-cmake-modules' 'qt6-tools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/taj-ny/kwin-gestures/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b41c5d4e929d48840d45e134e7f1c0dd50a87be48748bb19bc0fb3cec97c5710')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
}

build() {
	cd "$pkgname-$pkgver/build"
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
}
