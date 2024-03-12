# Maintainer: Tuncay <mamehiscore@aol.com>
pkgname=tochd
pkgver=0.13
pkgrel=1
pkgdesc="Convert game ISO and archives to CD/DVD CHD for emulation."
arch=('any')
url="https://github.com/thingsiplay/tochd"
license=('MIT')
depends=('python3' 'p7zip' 'mame-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53aede3024120221b98a50e2a7a2f7e937e2b2ae54303baa704dff04736710c2')

check() {
	cd "$pkgname-$pkgver"
	python3 "$pkgname.py" --version
}

package() {
	cd "$pkgname-$pkgver"
	install -m 755 -TD "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
	install -m 644 -TD "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -m 644 -TD "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
