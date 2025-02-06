# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250203.0
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
sha512sums_x86_64=('200b6a62e3ac40f41363f090c930a8c6bedf40e482e790e60f8d05430a2b92bf76f7b8b0ebe9555b4302256b0e7d52276747d8ce177c555891b09936ed1a9513'
                   'de0ecb509a9c0f2e66912868e1f1fe85502a153cfddf460ff3709506cdd459b375f912a87060742a5cc97f8e830d7893175c88c2a7aba0cf35c9af8236a94abe')
sha512sums_aarch64=('4b62e91e1c8709be1aacee8fdcea60fd8a0dfb36faff5ad2c8b904cdff3f0e04d06ab046c4a29802e4a545aec8f7966b074adfce2cf17b70faff07001e567384'
                    '0f0f83b7db96b188b6eb26e64f8ccf1324f02b2350001c1852fdf36f1ea4f0407e01c35743a8d5337ffd34182aeaa536cb809ecbeb7f06d627ab8e242a6006ad')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
