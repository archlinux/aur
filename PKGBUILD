# Maintainer: Alban Fichet <alban.fichet@gmx.fr>
pkgname=openexr-viewer
pkgver=0.5.2
pkgrel=10
pkgdesc="Simple viewer for OpenEXR files with detailed metadata display"
arch=('any')
url="https://github.com/afichet/openexr-viewer"
license=('BSD')
groups=()
depends=('openexr>3.0.1' 'qt5-base' 'qt5-svg')
makedepends=('git' 'cmake')
checkdepends=()
provides=($pkgname=$pkgver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/afichet/$pkgname.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
