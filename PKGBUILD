# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.1.1
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
sha256sums_x86_64=('224e0e06ea8adffd21a94382663081ae37d4be1aee21b02cad74cf6a13d8419d')
sha256sums_aarch64=('0d68c0cc2eddb5d4a28fc05636443b72aa0e136cf942cd096d90428de9810e37')

_package() {
	install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_spacetimedb-bin() {
	_package

	install -Dm755 'spacetimedb-standalone' "${pkgdir}/usr/bin/spacetimedb"
}

package_spacetimedb-cli-bin() {
	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
