pkgname=rpc-bridge-bin
_pkgname=rpc-bridge
pkgver=1.4.1.3
pkgrel=1
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux (binary release)"
url="https://github.com/EnderIce2/rpc-bridge"
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
license=("MIT")
arch=("x86_64")
source=("${url}/releases/download/v${pkgver}/bridge.zip"
  		"LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('2e348b851b54a99b6e062289bdb1f5bc4c86efcb1ef2b3e748ee29f0fdd143e7'
            'b1cee0c2bf34040f050e54f609e7f12f0bdf8cce528811f673fdd3f472aaae6f')

package() {
	install -Dm755 bridge.sh -t "$pkgdir"/opt/$_pkgname/
	install -Dm755 bridge.exe -t "$pkgdir"/opt/$_pkgname/
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
