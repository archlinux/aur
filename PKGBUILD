# Maintainer: Jari Ahola <aphototool@ahola.me>
pkgname=aphototoollibre
pkgver=1.0.4
pkgrel=4
pkgdesc="Photo editor for Linux"
arch=('x86_64')
url="https://www.ahola.me/aphototoollibre.html"
license=('GPL3')
depends=('qt5-base>=5.15.2' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver-$pkgrel-src.tar.gz::https://github.com/aphototool/A-Photo-Tool-Libre/archive/refs/tags/v$pkgver-$pkgrel.tar.gz"
	"$pkgname-$pkgver-$pkgrel-src.tar.gz.asc::https://github.com/aphototool/A-Photo-Tool-Libre/releases/download/v$pkgver-$pkgrel/v$pkgver-$pkgrel.tar.gz.asc")
sha256sums=('2ca931a4d6762112d6617dd0d3e926590424b00449d62177ed8302f411b61342' 'SKIP')
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

