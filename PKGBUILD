# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250505.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache-2.0')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
)
conflicts=(
	"${pkgname%-bin}"
)
source_x86_64=(
	"$_pkgbin-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgbin"
	"$_pkgshim-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgshim"
)
source_aarch64=(
	"$_pkgbin-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgbin"
	"$_pkgshim-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgshim"
)
sha512sums_x86_64=('25705616c3cfc82bb5772e815b2b6b030664dccba7a0db9babcfad5de46d16ce8bff8cd9cc11d366da4acd0f01fb04a0d95bbae070aa923f1492d2f142f271c3'
                   '11a1b003a73b2ae8924b03adc557966d815b79d756c9e40adc505c11ffe6f8e30153e5d133566bced39797fbd41651680fc17c0d7686d2ab3cf63b466e68dcc1')
sha512sums_aarch64=('1611599c6788d3c3f7495b5054aaf9ec81e7a714061582f913359886452fa14f8e65b2bd2d139bc24b5955749167f0db03aefaa6b3ae175296b56814f53d7898'
                    '42cd72f9b2011a8ad166d9dc246fdb46ef602aae43127373750a7ff65be84f8b300c50e4977495ce59670af5fc5f92c3c5ba96c5d751cb4e6e2fcce373210e06')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
