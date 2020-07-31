# Maintainer: Fredrik Söderström <tirithen@gmail.com>
pkgname=search
pkgver=1.1.1
pkgrel=3
pkgdesc="Search the web from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/tirithen/terminal-search"
license=('GPL3')
depends=(
  'liblphobos'
)
makedepends=(
  'dub'
  'ldc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tirithen/terminal-${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7019827fa42c6a0e07a79c43ffffc469e2a9d01c84c6aef3f1be7fcec9a33d85')

build() {
	cd "$srcdir/terminal-$pkgname-$pkgver"
  dub build --compiler=ldc2 --build=release
}

package() {
	cd "$srcdir/terminal-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
	cp $pkgname $pkgdir/usr/bin/
}
