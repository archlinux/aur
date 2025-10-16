# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20251013.0
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
sha512sums_x86_64=('923362961cfca5594468669a3ba59fa3f0e210ff9d24b175ad4ff767334d1440fda08423a4a598c64ba2b3e29c09a82eb947a2134d8eb8156e96e699a3b692ae'
                   'e5478ab26ed5e20a503661ccf23b39a45a2ef593e5ad2d8db36c4d44917747efdc22f6af8e76e0c0eeec91e28cc8efedd9c0ed640cde7c9d1843293d47b19196')
sha512sums_aarch64=('5b27f834190173fcae4ac7e1f0658bed093b1aa18884338474989977f252974ab856242abe5e4fff3e40e9e7e10f15391745805f17dd9414f6ec8f52bc1f2d7c'
                    '038c3a7180520538d488d6dead7c04555d82060d301e3d785b4b6315a33e51b20b7895caa8dedfcf8cfeb0f355ea7aea579c2ea34ea46c5aad408cc962dd282f')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
