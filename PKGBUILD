# Maintainer: Adrian Wersching <dev@awersching.com>

pkgname=wedder
pkgdesc="Current weather info for status bars like polybar"
pkgver=1.3.1
pkgrel=1

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
	'0e8f0c3d1f59091e217aa1b8fa9ce4531a216314e2bbb3931c5eab1398339b8a'
	'ceda7ab71b1f5e934c6e97653a1d52424723078af03bdaa6467c886574dd17b2'
	'10c6eb440ab29c7df846dbc0056b225d4a94ebba3a1e77ca3f3bf7d28e879eb7'
)

package() {
	install -Dm755 "wedder-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 wedder.toml "${pkgdir}/etc/${pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
