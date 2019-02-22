# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.0.2
pkgrel=1
pkgdesc="Dmenu/rofi interface for KeePass databases"
arch=("x86_64")
url=https://github.com/AlessioDP/kpmenu
license=("MIT")
depends=('xsel')
makedepends=('go')
optdepends=(
	'dmenu: dmenu support'
	'rofi: rofi support')
provides=("kpmenu")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlessioDP/kpmenu/archive/v$pkgver.tar.gz")
sha256sums=('8d469d1715f473060bdd9dccf63079d979d0df9b647b41124527b4c2ed4a7020')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}


