# Maintainer: Rutger Broekhoff <rutger@viasalix.nl>

pkgname='gyro-bin'
pkgver=0.7.0
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
sha256sums_aarch64=('0efe2542b40f6e65d507807ee37e9d8a9b3887100489aa97d6988479f62287ae')
sha256sums_i686=('a1112f5eb0efc99e30f9a5a9b36687c9e4379b3dae8954f9475f9d914036e1e2')
sha256sums_x86_64=('06b596dd3e2f76445300e619a9c4d8bdc3d0cbaf40202a90fe8c09d40343273f')

package() {
	local gyro_arch="$(get_pkg_arch)"
	if [[ "$gyro_arch" == "i686" ]]; then
		gyro_arch="i386"
	fi
	install -Dm755 "${srcdir}/gyro-${pkgver}-linux-${gyro_arch}/bin/gyro" "$pkgdir/usr/bin/gyro"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

