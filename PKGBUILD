# Maintainer: Avery Andrews avery.andrews@mf.me
pkgname=laigter
pkgver=1.11.0
pkgrel=1
pkgdesc="Automatic normal map generator for sprites!"
arch=('x86_64')
url="https://github.com/azagaya/laigter"
license=('GPL3')
depends=(
	'qt5-base'
	'hicolor-icon-theme'
)
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/azagaya/laigter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('77823b770f099843e1c0f6408156367c3f12b22dc897781aebe079c8a67c62e4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    qmake PREFIX="$pkgdir/usr" ../
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make install
}

