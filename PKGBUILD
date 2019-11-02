# Maintainer: Bruce Zhang
pkgname=qt-scrcpy
_name=QtScrcpy
pkgver=1.0.3
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('qt5-base')
provides=('qt-scrcpy')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/barry-ran/$_name/archive/v$pkgver.tar.gz")
sha256sums=('84c02a9402d7cbaf9626e625ccdde09de6f1d8bd6c02b66995650b312e537adc')

build() {
	cd "$srcdir/$_name-$pkgver"
	mkdir build
	cd build
	qmake ../all.pro CONFIG+=qtquickcompiler
	make
}

package() {
	cd "$srcdir/$_name-$pkgver/output/linux/release"
	install -Dm755 QtScrcpy "$pkgdir/usr/bin/QtScrcpy"
}
