# Maintainer: Rutger Broekhoff <rutger@viasalix.nl>

pkgname='gyro-bin'
pkgver=0.3.0
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
sha256sums_aarch64=('ad73a99227fb5e2d6cffd57362742b1a84f544071cffba540e87ef71aa02bf18')
sha256sums_i686=('d7c2038b70b302ec81a7610b139632cf4e13f554722bc00e7cb479726e83edad')
sha256sums_x86_64=('7cf4557d5b5051445af9dfce318f677c010bbb8326a28d19013cc0d92f3fd225')

package() {
	local gyro_arch="$(get_pkg_arch)"
	if [[ "$gyro_arch" == "i686" ]]; then
		gyro_arch="i386"
	fi
	install -Dm755 "${srcdir}/gyro-${pkgver}-linux-${gyro_arch}/bin/gyro" "$pkgdir/usr/bin/gyro"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

