# Maintainer: Rutger Broekhoff <rutger@viasalix.nl>

pkgname='gyro-bin'
pkgver=0.5.0
pkgrel=1
pkgdesc="A Zig package manager with an index, build runner, and build dependencies"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/mattnite/gyro"
license=('MIT')
provides=('gyro')

source=(LICENSE)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/mattnite/gyro/releases/download/${pkgver}/gyro-${pkgver}-linux-aarch64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i386.tar.gz::https://github.com/mattnite/gyro/releases/download/${pkgver}/gyro-${pkgver}-linux-i386.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/mattnite/gyro/releases/download/${pkgver}/gyro-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e8b7547024443b2fae2609708ffd1680a8f1973214f1523419fe91bd52aa8552')
sha256sums_aarch64=('1ec28df03b9af9323d309b6009b543df337cae05cb4a8147acd99f7b2a3f841b')
sha256sums_i686=('79940d8e41e49281647513763581bfe2820b9411ea83aeddceed424738055215')
sha256sums_x86_64=('6eee57288c6a165a294016a041681be462f5f00f05cdf56a5c6806ce5ea35599')

package() {
	local gyro_arch="$(get_pkg_arch)"
	if [[ "$gyro_arch" == "i686" ]]; then
		gyro_arch="i386"
	fi
	install -Dm755 "${srcdir}/gyro-${pkgver}-linux-${gyro_arch}/bin/gyro" "$pkgdir/usr/bin/gyro"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

