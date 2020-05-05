# Maintainer: Adrian Wersching <dev@awersching.com>

pkgname=wedder
pkgdesc="Current weather info for status bars like polybar"
pkgver=1.1.0
pkgrel=1

arch=("x86_64")
url="https://github.com/awersching/wedder"
license=("MIT")
conflicts=("wedder-git")

source=(
	"https://github.com/awersching/wedder/releases/download/${pkgver}/wedder-${pkgver}-x86_64-unknown-linux-gnu"
	"https://raw.githubusercontent.com/awersching/wedder/${pkgver}/examples/wedder.toml"
	"https://raw.githubusercontent.com/awersching/wedder/${pkgver}/LICENSE"
)
sha256sums=(
	"2d6e522e73d17ad283bbe341d3d0b415ba5568127328935a17f809d5c0da49a9"
	"3e07539912adf479a59bea4eccae43cd5030997e41360cc2cf1ebf376e4b8948"
	"10c6eb440ab29c7df846dbc0056b225d4a94ebba3a1e77ca3f3bf7d28e879eb7"
)

package() {
	install -Dm755 "wedder-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 wedder.toml "${pkgdir}/etc/${pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
