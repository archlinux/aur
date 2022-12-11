# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'zlib')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zerodaycode/Zork/releases/download/v${pkgver}/zork-linux.tar.gz"
	"$pkgname-$pkgver-src.zip::https://github.com/zerodaycode/Zork/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=(
	'7c450889767761aa3e5880adba91058684d14fa3d90cb16b80d4b558e088347b'
	'773dfa8a6f592743ba39357e53b96493d407a84ab541e51b519f277c0a2f5785'
)

package() {
	install -Dm644 "${srcdir}/Zork-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/dist/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
