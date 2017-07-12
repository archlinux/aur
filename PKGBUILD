# Contributor: André Klitzing <aklitzing () gmail () com>
# Maintainer: André Klitzing <aklitzing () gmail () com>
# AUR Category: devel

pkgname=clazy
pkgver=1.2
pkgrel=1
pkgdesc="Qt oriented code checker based on clang framework"
url="https://github.com/KDE/clazy"
license=("GPLv2")
depends=('llvm' 'clang')
makedepends=('cmake')
arch=('x86_64' 'x86')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDE/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

sha256sums=('e4177a1a0e1d03577714fd95091e2af2f9ec0bda6cab1d1eab4f3232f53afb7e')
