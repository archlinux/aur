# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.1.0
pkgrel=1
pkgdesc="Dmenu/rofi interface for KeePass databases"
arch=("x86_64")
url=https://github.com/AlessioDP/kpmenu
license=("MIT")
makedepends=('go')
optdepends=(
	'dmenu: dmenu support'
	'rofi: rofi support'
	'xsel: xsel support'
	'wl-clipboard: wl-clipboard support')
provides=("kpmenu")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlessioDP/kpmenu/archive/v$pkgver.tar.gz")
sha256sums=('7a13052fdcc1767678a32c7042a089f7128ad401adf543f684d0208da49ecc4f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}


