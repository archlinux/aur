# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgname='runsc'
pkgver=20220228.0
pkgrel=2
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
	"$_pkgname"
)
conflicts=(
	"${pkgname%-bin}"
	"$_pkgname"
)
source_x86_64=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/x86_64/$_pkgname")
source_aarch64=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/aarch64/$_pkgname")
sha512sums_x86_64=('00b65f872785f77d61c789c4589e56d085697ef6d6c89370dceca0d464df7d267a65b2fcd63bd7513910b28e72cc9f22991139c262b42c84a25f0f55136ba736')
sha512sums_aarch64=('09b1148d9ca601236e0bc37bedb2439e1ccf725396343ed895746e688d095669a8be190b201d1c4129b7dfcef7d80780b525563ce3202c83f24874422d071a8e')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
