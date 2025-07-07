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
sha256sums=('daf4315198791d954766ee48b96fa446ce229373077de5fab2af599707c5000f')
sha256sums_x86_64=('8e525ce56432982676dc77cf68f8908ecd31bde16382cf82306fc0816dcf52de')
sha256sums_aarch64=('cb81198608faa33abd2ee6f4143f2615b0c18e37441e66b4a57242ffe5498140')

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
