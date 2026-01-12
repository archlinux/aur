# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260105.0
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
sha512sums_x86_64=('15c8adabc9f1006d469177b0ec3962d4993e01c85be17d381a4979029eacc7db37ef354e3eafd279573135a1adf81baffc5c19f2bbfac932c79386f6ac74e52f'
                   '7f3f5a864fda5f4e2de9db20dd5edad60b6aa467cc7c22d13f40cdce811783d66018f2c28fb74b907c6d6ac0e39f6d0e1047f1f33447b8a8682f1fbaa25edeb4')
sha512sums_aarch64=('cc98ad73e8d181f4738c97883180bc76cf8b2eb773c11f3a44f1636d0b0e00f2ee9228e4eecd414f94d6410f4877e6c93260b8070130fba767583026115d1038'
                    'cfe8a07c304dca21171e5a76614ac3605f5b1ec8f9ed2eeac014a44bc00821864f219db0e25fcc1c56cedbe335bbf34a7fa6bc57335888dcd04278bc0263f5cc')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
