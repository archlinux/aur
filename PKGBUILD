# Maintainer: Rutger Broekhoff <rutger@viasalix.nl>

pkgname='gyro-bin'
pkgver=0.4.1
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
sha256sums_aarch64=('6bdd2bf37f518c1db4185edf207a50e1a150c72d7b66f1ed6a0b6699b08e2065')
sha256sums_i686=('b2a28dd40f5add690af2d48e6de9636d0e4817b8b39519501a034344b0f143c9')
sha256sums_x86_64=('06a69f91775077d1ae900ae3b89f58770a3e8f7903a5803e13fb3d1aab74f2b6')

package() {
	local gyro_arch="$(get_pkg_arch)"
	if [[ "$gyro_arch" == "i686" ]]; then
		gyro_arch="i386"
	fi
	install -Dm755 "${srcdir}/gyro-${pkgver}-linux-${gyro_arch}/bin/gyro" "$pkgdir/usr/bin/gyro"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

