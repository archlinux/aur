# Maintainer: Fredrik Söderström <tirithen@gmail.com>
pkgname=search
pkgver=1.1.1
pkgrel=2
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
sha256sums=('8911dae02c0d58090eff96b35636435bb5877e263c4b9c19086defc4fdc6597c')

build() {
	cd "$srcdir/terminal-$pkgname-$pkgver"
  dub build --compiler=ldc2 --build=release
}

package() {
	cd "$srcdir/terminal-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
	cp $pkgname $pkgdir/usr/bin/
}
