# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++-bin
pkgver=0.4.1
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
	'6b15c131cec5169320a9c2a6e47f06a574c4106fd8fbc1cab5aa066c07a85793'
	'9cd1a516f593ff7e5d52df7903c516e498d2e07b9fe2556f9605ac66e681027b'
)

package() {
	install -Dm644 "${srcdir}/Zork-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/dist/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
