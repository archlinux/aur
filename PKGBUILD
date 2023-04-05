# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++-bin
pkgver=0.8.6
pkgrel=2
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zerodaycode/Zork/releases/download/v${pkgver}/default.zork++.zork++.tar.gz"
)
sha256sums=(
	'78dfab8b6d91de60a71424d709548ee6cd11a2c7a0659b502effddc4402fc01a'
)

package() {
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/target/release/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
