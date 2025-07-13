# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250707.0
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
sha512sums_x86_64=('348687c9a10c23a51da5dcffcd9e1866250b2a964aa1f599ccd706c41bf0b85823875d6edd5b4dbc1f2e9229eed6d9cb13193fc13b988d3ea614bed9b4ebe955'
                   'c171aeba73e56ad81e55dbd31b518401ca88ae3bcfa9d8209d3b28122b06e5c79e0fdb8bc25a748bc0426241bf5225f466f5ad138f61b488046e258bcf70a30d')
sha512sums_aarch64=('c2f7539edb022c01912eee358f57f0fdee2c7333323e46f53a3892a3d367746cbb5cb472070a3ebabbfde4491009613a663f9ab5f2bdea7059e21ea2764614a0'
                    '2f891792ae6610b471111ad917ddf69b2504ba741490e8e120b268b5e1340c445af89512c52a5c3376ca31dd857722b69f5dd0e79e3cf81d9ecde021054a0f73')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
