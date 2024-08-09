# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240807.0
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
sha512sums_x86_64=('058853fa657216499bdfd33cf779b2570c8edb408a9eb816e0c87a22d30eedae93d18ea61fda85ae1fa93523e483c380164abe680f9018c27ee352a9ed7f4ea9'
                   '48a0a53d914fb2d67ad581c6983a9309fc2dcfbb9e012ca3ef09d16b0c1e72b97a18d4997254336342fc000ae875b89f46173fab5ab65b56a4eec9b316bfc787')
sha512sums_aarch64=('1b463345d6986810152f420b45f48cdd5b4a28cc07820094daab7621ac555cd2c8a1e9dfa7f9b2952c6fe3b41acfee0253822f62c8de9a87048de627e0254a01'
                    '9143044b1ba9cfd2a38b72e605feedef60dd202d8723ba102e81b81235f1c9e736711189a2d3c166c96a79c97b154e33c9e449b4451ea5b92c5191564d565805')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
