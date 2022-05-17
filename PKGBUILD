# Maintainer: Jari Ahola <aphototool@ahola.me>
pkgname=aphototoollibre
pkgver=1.0.3
pkgrel=1
pkgdesc="Photo editor for Linux"
arch=('x86_64')
url="https://www.ahola.me/aphototoollibre.html"
license=('GPL3')
depends=('qt5-base>=5.15.2' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver-$pkgrel-src.tar.gz::https://github.com/aphototool/A-Photo-Tool-Libre/archive/refs/tags/v$pkgver-$pkgrel.tar.gz"
	"$pkgname-$pkgver-$pkgrel-src.tar.gz.asc::https://github.com/aphototool/A-Photo-Tool-Libre/releases/download/v$pkgver-$pkgrel/v$pkgver-$pkgrel.tar.gz.asc")
sha256sums=('8b7f913f48ce3701c5a500c33050e84e50b90df97d141d723117cddf13d8d06a' 'SKIP')
validpgpkeys=('A970F7E40CB64F0D5B9FC516AFE56C2DF614820C')

build() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	qmake
	make
}

package() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	make INSTALL_ROOT="$pkgdir/" install
}

