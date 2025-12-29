pkgname=rpc-bridge-bin
_pkgname=rpc-bridge
pkgver=1.4.0.1
pkgrel=2
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux (binary release)"
url="https://github.com/EnderIce2/rpc-bridge"
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
license=("MIT")
arch=("x86_64")
source=("${url}/releases/download/v${pkgver}/bridge.zip"
  		"LICENSE::${url}/blob/master/LICENSE")
sha256sums=('a8211bb1fc03497e977b1f4d3a4c3303688ab0434d11dfdd940a3b1dd6ad11e0'
            '7b519b329d4028c42e3671490fd7cc8c42ef67dec762b0a6630b233f9498d847')

package() {
	install -Dm755 bridge.sh -t "$pkgdir"/opt/$_pkgname/
	install -Dm755 bridge.exe -t "$pkgdir"/opt/$_pkgname/
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
