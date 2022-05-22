# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220510.0
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
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/x86_64/$_pkgbin"
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/x86_64/$_pkgshim"
)
source_aarch64=(
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/aarch64/$_pkgbin"
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/aarch64/$_pkgshim"
)
sha512sums_x86_64=(
	'e5bc1c46d021246a69174aae71be93ff49661ff08eb6a957f7855f36076b44193765c966608d11a99f14542612438634329536d88fccb4b12bdd9bf2af20557f'
	'f24834bbd4d14d0d0827e31276ff74a1e08b7ab366c4a30fe9c30d656c1ec5cbfc2544fb06698b4749791e0c6f80e6d16ec746963ff6ecebc246dc6e5b2f34ba'
)
sha512sums_aarch64=(
	'46c40fa098936037a18bc83af4836d401368f83bf1924d87ec740a7284a442b3875ceba538f78cdd976682814c68daa5d36edb86e77450ef72437ea60c15e09c'
	'd63e99a659d1e9c7ed97cac9bf5c9822beabaf2841be42d67befd3e41c376e33c7b06d77de97fc38118ff0db389d3179ea34839f30fb218355bb81971b0f45dc'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
