# Maintainer: Joseph Vigil <joeyvigil109329@gmail.com>

_repo=https://github.com/joeyvigil/cfish

pkgname=cfish
pkgver=1.0
pkgrel=1
pkgdesc='A terminal aquarium screensaver: colorful fish swimming across your terminal, leaving bubble trails'
arch=('x86_64' 'aarch64')
url="$_repo"
license=('MIT')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35ea0ad1a2e524fab3effaa4275bc2f33ef36ab5808dd7cd8e3f81e3bf22933e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
