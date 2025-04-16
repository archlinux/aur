# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250407.0
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
sha512sums_x86_64=('097259d6d93548bf669e21cfec5ba6a47081e43f61d22c5d8a8a4c0c209c81ac9c4454162b826f98cec49e047bbdc29c270113ab6db5519ef3e6a90f302fa47b'
                   '09acdc895cea6706ba528939da2e6ddab148dfee56addb0d52d7af74378454f4e05cfd47cbb29ad0569139c49cf298be9d4b94a3c2d28b75c05f713e425746e8')
sha512sums_aarch64=('cb590f72b0fbda45e89a2300e9247f12ff295a8c52653c8cf815c662d3fbbc774f9b915cdd4fad59e30694d8cc8737fe2a1a8186ab5136f7701bd6e6877a1662'
                    '1c3838e10c905af0cb52697712bf6bd76b94c9e9d3d07a7643cd43dc2f8dab03b4ed4693c117e555e07a158e04ee583b6b1f1cf2fb9705244ffa5fdc4af67248')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
