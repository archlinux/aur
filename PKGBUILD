# Contributor: André Klitzing <aklitzing () gmail () com>
# Maintainer: André Klitzing <aklitzing () gmail () com>
# AUR Category: devel

pkgname=clazy
pkgver=1.3
pkgrel=2
pkgdesc="Qt oriented code checker based on clang framework"
url="https://github.com/KDE/clazy"
license=("GPLv2")
depends=('llvm' 'clang')
conflicts=('clazy-git')
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

sha256sums=('c441224cf9e0e8ecc3b2f591e255073ae79a1d0fcf77bceca4493aa286cc2899')
