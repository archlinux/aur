# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230102.0
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
sha512sums_x86_64=('86fb3445a655b0927d0896c7fa5a4f1e80a836a38b4a3bb8783f9fa6e4a3ed251867bb460c919fa91848bcff43764491095da706a40b7e75a73894cf1adc4087'
                   'a755d24368b83b6f4388fc922f60222b060b92d613a541b89e241e5c42889c5f9043e8095c5b4be5e34cca836cbbb00d258558595e6189f96cfdcff91293da22')
sha512sums_aarch64=('cfb1cd42507fbe44e74cda1bafafe67cb24d4f3142310ad5da0034418ff1c69ecb3e0c6b211571bb7b255679c346d372983f023e297e52208537b7a6f03f117e'
                    '113e24d2dae9d614b2774e632abd509fe4b52320f4111a97b4892c20324659a31991aae08ccb32091d2a804a4a569ee3e488faba4d0fc68ef4c1a60e0a9b4608')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
