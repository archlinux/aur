# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250304.0
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
sha512sums_x86_64=('b43e386a95dd91f6c5af72c303be8d37b0e0fef60f199916b21760c4e3582865c483bb86d67d60e68342f7512da73bfaa270ff06c5421912ba8c84f272ade48d'
                   '124be185c421f4620417f21e3a9c50569b6310aeb296dc242fa98ceb403f2990aac77d507690fcdd7d200a861f7c95ee44cfbaa6c59155b23ff66a9dbf25994f')
sha512sums_aarch64=('3e069ef4a4879747ca044b23babbc231367f5dcb36f2755e297d9bef8b8a649f6a05495b43f662a636a92d81312d0eb572663e34f164010b23dda7a707bee3d6'
                    '3e663aa9fb30fc144ffc02eff1e2104ff9e622dadbba73176933ecacf94372d88dea15e18bbdfb9233224bbb03cdb7fdaaa1ace02c1a7feb9c07b0c0571fab28')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
