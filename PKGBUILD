# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'zlib')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zerodaycode/Zork/releases/download/v${pkgver}/default.zork++.zork++.tar.gz"
)
sha256sums=(
	'663044e47e0f9cf9db919f276cd074df8ccb7e809055583378f63c4bb22814da'
)

package() {
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/target/release/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
