# Maintainer: lesto <lestofante88@gmail.com>

pkgname=ksysguard-gpu
pkgver=0.5
pkgrel=1
pkgdesc="gpu visualization for ksysguard"
arch=(any)
url="https://github.com/lestofante/ksysguard-gpu"
license=('GPL3')
depends=('python')
optdepends=('ksysguard: For connecting to script as intended'
			'radeontop: AMD card support'
			'intel-gpu-tools: Intel card support'
			'nvidia-utils: NVIDIA card support')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('266cdb212c1861699f7815c4d10f7b7fa75292cbd8e2c0425f184ef46b0bf75d')

package() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm644 "systemd-unit/ksysguard-gpu.service" "${pkgdir}/usr/lib/systemd/system/"
	install -Dm755 "src/ksysguard-gpu.py" "${pkgdir}/usr/bin/"
}
