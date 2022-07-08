# Maintainer: Tuncay <mamehiscore@aol.com>
pkgname=tochd
pkgver=0.9
pkgrel=3
pkgdesc="Convert game ISO and archives to CD CHD for emulation."
arch=('any')
url="https://github.com/thingsiplay/tochd"
license=('MIT')
depends=('python3' 'p7zip' 'mame-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddb3912f24544ddda315a45b8b9cec8d7f24481861e557a7e87252fdbd29108a')

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
