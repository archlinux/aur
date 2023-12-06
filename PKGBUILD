# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20231204.0
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
sha512sums_x86_64=('916cf0accb069eac8ab22a6ba69e79bcc894e63d36a039ec3a1c41b52714c479c2f88b7f067b086c1491a6db5273dc230bd2c7c4506d3b3f0fdcf21b05fde75e'
                   'e5c4f8badd3217782a4ed96cdea81c9fcbdf79a64cf8b3ad64d362c6a5755fa51ceb77219c4b0f0a29674026ea11615605e54eeef774e99220a8156eb1adcb6b')
sha512sums_aarch64=('eab2e0ea8fbda9e4d3c15f17f24015a117af677e51b42d2f030c7b8a81c38a5f1d984113961c8789508bb14046975da9c689475b05e2d6633b7296b1bffd9038'
                    'b380ed0aa1d420d041286d9ad622673ea397592fe320542521b7e03c776f8902b9a78059f5b741d68beb20ea9d5b6f195f8123aa5d6c011933d4456f09a4ed3f')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
