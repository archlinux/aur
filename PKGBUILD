# Maintainer: Adrian Wersching <dev@awersching.com>

pkgname=wedder
pkgdesc="Current weather info for status bars like polybar"
pkgver=1.0.4
pkgrel=2

arch=("x86_64")
url="https://github.com/awersching/wedder"
license=("MIT")
conflicts=("wedder-git")

source=(
	"https://github.com/awersching/wedder/releases/download/${pkgver}/wedder-${pkgver}-x86_64-unknown-linux-gnu"
	"https://raw.githubusercontent.com/awersching/wedder/master/example/wedder.toml"
	"https://raw.githubusercontent.com/awersching/wedder/master/LICENSE"
)
sha256sums=(
	"19fdb2c7b7a59ce8322dbee2471ee256116f1242b13661b7b4d686ff39ca3137"
	"7fec0e3dddf9bd7166f88541078ea22619a4b4da06f9c8fb57ef78da97dba398"
	"10c6eb440ab29c7df846dbc0056b225d4a94ebba3a1e77ca3f3bf7d28e879eb7"
)

package() {
	install -Dm755 "wedder-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 wedder.toml "${pkgdir}/etc/${pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
