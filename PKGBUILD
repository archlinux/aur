# Maintainer: Tuncay <mamehiscore@aol.com>
pkgname=tochd
pkgver=0.12
pkgrel=1
pkgdesc="Convert game ISO and archives to CD/DVD CHD for emulation."
arch=('any')
url="https://github.com/thingsiplay/tochd"
license=('MIT')
depends=('python3' 'p7zip' 'mame-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70d8586aa1b09f45966786bf72813c6571ddedcd6f2fdad9f2641e1c9d1a9ec2')

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
