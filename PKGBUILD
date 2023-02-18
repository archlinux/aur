# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230214.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
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
sha512sums_x86_64=('365f61f7c9c16621a66a6802012a1b2f438142b7f23f8039ff49023dc403fa70aaf323a789033c97e0c7f5ab864e923d1f229a8734a27b550c12947e6b4647f5'
                   'da396e687136abc1750ed63f8db9cd0bc626e87d0f366d9feb37d8a3bcc01f248a3e30e4f8d2843c45f0974b1b88d3dcba3687ec1d5929bb00bd7cee9951e58a')
sha512sums_aarch64=('a4c0c77e6d51b7eeadec11853aeb0fef6e6ec801fb020bf68a4368449e59b28d8e88dc4509d1f3793430cdde4b9adb1e3e2fb989de24547322cb135dc2c6e67d'
                    'ae044b03ca364f33d694f6caecea6c314f7a1572fc8a91bbfb8d1af1a5dbdc1f96bea8b5f055ea2ab9bee25da0c6019451c167e60be661c5d4cf267e29b41705')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
