# Maintainer: Adrian Wersching <dev@awersching.com>

pkgname=wedder
pkgdesc="Current weather info for status bars like polybar"
pkgver=1.2.0
pkgrel=2

depends=("openssl-1.0")
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
	"8ae6e42353ea1c752e609032bf9884667dd13fe79137185b6e321cdd50454d71"
	"237d445784d8c53c152554f2d3ea0d7a83961f3bc8c4400d2a6af0fd557b28ca"
	"10c6eb440ab29c7df846dbc0056b225d4a94ebba3a1e77ca3f3bf7d28e879eb7"
)

package() {
	install -Dm755 "wedder-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 wedder.toml "${pkgdir}/etc/${pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
