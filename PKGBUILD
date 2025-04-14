# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=lncur
pkgver=1.0.2
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
sha256sums=('1ad30da4b640addbf7ab77718e4efeb7678c44769e0377e02d055a190dbbfb95')

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
