# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.2.0
pkgrel=1
pkgdesc="A relational database and a server combined into one (bin version)"
arch=('x86_64' 'aarch64')
url="https://github.com/clockworklabs/SpacetimeDB"
license=('custom')
source=("${url}/raw/refs/tags/v${pkgver}/LICENSE.txt")
_source=("${url}/releases/download/v${pkgver}/spacetime-${CARCH}-unknown-linux-gnu.tar.gz")
source_x86_64=("${_source[@]}")
source_aarch64=("${_source[@]}")
sha256sums=('c28e9285c496925ba3ad41ee05342bc3122b4a8501e71b1ad573b012084aabd9')
sha256sums_x86_64=('405043af3e3d8b6ccafa9cc880b9204a997dea61099a81eef1533b42b5c02a15')
sha256sums_aarch64=('bc1f071f9acb2d2743f7b91a906e72a7ef4f1f960b7627fbb0677ea6dcfa938f')

_package() {
	install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_spacetimedb-bin() {
	_package

	install -Dm755 'spacetimedb-standalone' "${pkgdir}/usr/bin/spacetimedb"
}

package_spacetimedb-cli-bin() {
	optdepends+=('binaryen: for wasm-opt')

	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
