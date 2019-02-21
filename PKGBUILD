# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.0.1
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
sha256sums=('9b1c594487afe2ef37e218f2f2c176c165bee459791cbd6b407c298275d2a670')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}


