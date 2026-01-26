pkgname=rpc-bridge-bin
_pkgname=rpc-bridge
pkgver=1.4.0.1
pkgrel=3
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux (binary release)"
url="https://github.com/EnderIce2/rpc-bridge"
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
license=("MIT")
arch=("x86_64")
source=("${url}/releases/download/v${pkgver}/bridge.zip"
  		"LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('a8211bb1fc03497e977b1f4d3a4c3303688ab0434d11dfdd940a3b1dd6ad11e0'
            '419928e52b5c005dcc09a6b56a5a205a2f0006e731abf7e323d78fead7b6ab72')

package() {
	install -Dm755 bridge.sh -t "$pkgdir"/opt/$_pkgname/
	install -Dm755 bridge.exe -t "$pkgdir"/opt/$_pkgname/
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
