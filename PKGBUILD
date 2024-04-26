# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>

pkgname='wiredpanda'
pkgver=4.1.12
pkgrel=1
pkgdesc="Software developed in order to help students learn about logic circuits."
arch=('x86_64')
url="https://gibis-unifesp.github.io/wiRedPanda/"
license=('GPL-3.0-or-later')
depends=('git' 'qt5-base' 'qt5-multimedia')
makedepends=('git')
backup=('etc/pacman.conf')
source=("https://github.com/GIBIS-UNIFESP/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

build() {
  mv "$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
  mkdir build/ && cd build/
  qmake ../WPanda.pro
	make -j
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
