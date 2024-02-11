# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240206.0
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
sha512sums_x86_64=('9dca345fa47513c5c9353802b70bd0f00bd00f28d96186229cd94adaa14898105a7ac343c54ac8a3304f99d7a5508e4e1f96d8de68231a0717e13ab705d6408f'
                   'd0d32377107ee82ad13c4babaa17552f0c48cca533e3f5290a9271811bfc5e20595c63d014637bec63761bbe9a54fbb87ff9f6f091e273dffe9649bdd177733b')
sha512sums_aarch64=('efb41e38e92561e0a7158d22f6523cc7ed56736b4af61efdf6330dede377c908f23d26b0e841d81f8e9886968023edb732008c13f5eda97d220be93bb50a19a8'
                    '6cf5504dcb2fadeb8efb5d31f2d9507ecb60288d4357fbdcc9fa5f304edb0c18812c37a34f87637b9a61b2a6269b900e354817abe3119fe6e66ccaa9b2d661c6')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
