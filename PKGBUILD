# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=lncur
pkgver=1.0.0
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
sha256sums=('f3009616c28409a9a49fb42d6cfd2a39b388ca46765293292b7b726fc43f66ea')

build() {
	cd "$pkgname-$pkgver"
	pyinstaller --onefile $pkgname.py
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin"
	cp "dist/$pkgname" "$pkgdir/usr/bin/"
}
