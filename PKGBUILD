# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>
pkgname=thapo-calc
pkgver=0.2
pkgrel=2
pkgdesc="ThApo-Calc (Thanos Apostolou' Calculator) is a simple calculator written in c++"
arch=('x86_64')
url="https://gitlab.com/ThanosApostolou/thapo-calc"
license=('GPL3')
source=("https://gitlab.com/ThanosApostolou/thapo-calc/-/archive/0.2/thapo-calc-0.2.tar.gz")
md5sums=('538d580e92fa92f694e793e72b509a73')
makedepends=('meson')

build() {
	cd "$pkgname-$pkgver"
	arch-meson builddir
	ninja -C builddir
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C builddir install
}
