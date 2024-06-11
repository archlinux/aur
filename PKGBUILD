# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240603.0
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
sha512sums_x86_64=('1c110c28bdf48fa20ba061a164e4a9f18ffd09c18f50fe353a7963f4d002ac63a0e8459c743b6988bc551dbda4018fa7603d69b909fcf810f5dc8f2e14fb4347'
                   'be6c24182f25bb06e0befe2a2fd83b31c4867bc9ceae795310a19c7d75485be405282d0b8afb60b4218ce55b668bc1c73affbaa6071ff562aa3a25f674502c7a')
sha512sums_aarch64=('107d63e743b215f5cb8580151453955a2b38ae9249e38bc9d2f2373f827d97900573a7b2e129816c45ea1fddd5c1484a9a9a26870083290bccee0261356dc1c7'
                    '81067427707a5588670d7a3040c7ca4ed84e2cea2310a84a96758013807eb5b27b7f890a65bc23e1aad07c060f572d42152edae4513995b9a3c44831aa7d1537')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
