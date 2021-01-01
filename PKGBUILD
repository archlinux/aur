# Maintainer: Nathan Reiner <nathan.p.reiner@gmail.com>
pkgname=libretextus
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Bible Accordance Application"
arch=('any')
url="https://libretextus.github.io"
license=('CC0')
groups=()
depends=('gtkmm3' 'rapidxml' 'boost')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=libretextus.install
changelog=
source=("$pkgname-$pkgver::git://github.com/LibreTextus/LibreTextus.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr/" install
	rm -rf "$pkgdir/bin/"
}
