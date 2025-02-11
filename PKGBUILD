# Maintainer: Simon <vesspa0330@gmail.com>
pkgname=color-converter
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool for converting color codes."
arch=('any')
url="https://github.com/sotrali/color-converter"
license=('MIT')
depends=('python3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbef1049fc0e079c2ca5fa40fdaca1a55b491a4d9d6992edbf497defe5e98796')

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
