# Maintainer: lesto <lestofante88@gmail.com>

# Based on: ksysguard-gpu-bin from katt <magunasu.b97@gmail.com>

pkgname=ksysguard-gpu
pkgver=0.5
pkgrel=4
pkgdesc="gpu visualization for ksysguard"
arch=(any)
url="https://github.com/lestofante/ksysguard-gpu"
urlgit="https://github.com/lestofante/ksysguard-gpu.git"
license=('GPL3')
depends=('python')
optdepends=('ksysguard: For connecting to script as intended'
			'radeontop: AMD card support'
			'intel-gpu-tools: Intel card support'
			'nvidia-utils: NVIDIA card support')
source=("$pkgname-$pkgver"::"git+$urlgit#tag=$pkgver")
sha256sums=('SKIP')

package() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	install -Dm644 "systemd-unit/ksysguard-gpu.service" "${pkgdir}/usr/lib/systemd/system/ksysguard-gpu.service"
	install -Dm755 "src/ksysguard-gpu.py" "${pkgdir}/usr/bin/ksysguard-gpu.py"
}
