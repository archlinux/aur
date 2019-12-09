# Maintainer: Adrian Wersching <dev@awersching.com>

pkgname=wedder
pkgdesc="Current weather info for status bars like polybar"
pkgver=1.0.6
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
	"ccf66ef2c1890ad963d3e3ed01adcf7b36632a9c91ebddbf69587f15d2506a2a"
	"e238cc10740469a9e879e89f5f2d6293762e35f74d0d5b719cdb21d494f2a6ea"
	"10c6eb440ab29c7df846dbc0056b225d4a94ebba3a1e77ca3f3bf7d28e879eb7"
)

package() {
	install -Dm755 "wedder-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 wedder.toml "${pkgdir}/etc/${pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
