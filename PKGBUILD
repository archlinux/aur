# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=lncur
pkgver=1.0.1
pkgrel=1
pkgdesc="Script to automate symlinking files when porting Windows cursors to Linux"
arch=(x86_64)
url="https://github.com/claymorwan/lncur"
license=('MIT')
depends=('python')
makedepends=('pyinstaller')
provides=($pkgname)
conflicts=($pkgname)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd3781193f8ee6261a70d6a30efa84f66ca84f44f4506872aad795e7ff18233d')

build() {
	cd "$pkgname-$pkgver"
	pyinstaller --onefile $pkgname.py
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin"
	cp "dist/$pkgname" "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
