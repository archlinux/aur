# Maintainer: Jari Ahola <aphototool@ahola.me>
pkgname=aphototoollibre
pkgver=1.0.6
pkgrel=1
pkgdesc="Photo editor for Linux"
arch=('x86_64' 'aarch64')
url="https://www.ahola.me/aphototoollibre.html"
license=('GPL-3.0-or-later')
depends=('qt5-base>=5.15.2' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver-$pkgrel-src.tar.gz::https://github.com/aphototool/A-Photo-Tool-Libre/archive/refs/tags/v$pkgver-$pkgrel.tar.gz"
	"$pkgname-$pkgver-$pkgrel-src.tar.gz.asc::https://github.com/aphototool/A-Photo-Tool-Libre/releases/download/v$pkgver-$pkgrel/v$pkgver-$pkgrel.tar.gz.asc")
sha256sums=('d0a9ea63142e12f412e36e5a58d20789b542ed6f7113556d0d614a35bd58a483' 'SKIP')
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

