# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260706.0
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
sha512sums_x86_64=('73938c145ebe554cf61a01da455688f4b732eebdf7b1b635bdef5b195868b363d8cb400e3d92ed1f377b78996805556c247a4849583910cb04e92b156053033e'
                   '6f1b34266ed3ab503f6e88116dd97d0fb5f79311ea174059dd284de11b36ee062649da2fe3dccea9e2d25abe4df04bee5ee443ec0b9348ae44e63fabda28e8f8')
sha512sums_aarch64=('a4962fe56ee62c841c270443a3617b6626db3fb282e65793f6762df78b3209304dfe2e094e524b3d2b4c781c05b1b95744ce9fe50b49edee43090b27c2956c4b'
                    '2ddb4eacc5a30e2aadf882b6dfa86b579ce46861f0cd13bc415c18b88d9c4d8309ec0bc7ddfe741b2fb5747af6c9f2f736e2169c1a46fb6f1a227f4b8962a88b')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
