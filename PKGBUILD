# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++-bin
pkgver=0.4.2
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
	'0d0bd50235ac4c53e9359d6a1f8fed2e7d2cbe7e631344b8e550ba7984ec802c'
	'cc9de2ae16fa053d15b4e7ca80b141593af6117939c98bc4fbdf4ae4e1b46b85'
)

package() {
	install -Dm644 "${srcdir}/Zork-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/dist/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
