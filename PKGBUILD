# Maintainer: Rutger Broekhoff <rutger@viasalix.nl>

pkgname='gyro-bin'
pkgver=0.6.0
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
sha256sums_aarch64=('268127ce0626c2f3062ae0d08d9226ad4efeb111429790073bb0f31e4ed696be')
sha256sums_i686=('6425d605347ceda35360734d28f08cc76eb6b5839438aa9e25d642fd1430fd19')
sha256sums_x86_64=('2b947a5f39797924667bdf0d3793f4c5400fa90ad517c9605829071736badd74')

package() {
	local gyro_arch="$(get_pkg_arch)"
	if [[ "$gyro_arch" == "i686" ]]; then
		gyro_arch="i386"
	fi
	install -Dm755 "${srcdir}/gyro-${pkgver}-linux-${gyro_arch}/bin/gyro" "$pkgdir/usr/bin/gyro"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

