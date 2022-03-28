# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220228.0
pkgrel=3
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
	'00b65f872785f77d61c789c4589e56d085697ef6d6c89370dceca0d464df7d267a65b2fcd63bd7513910b28e72cc9f22991139c262b42c84a25f0f55136ba736'
	'a66c0d9b351f3f220ad6ce2953e4b06f4faaf10bc3cfb316f6d42037e0304f0f6e1afd41ee8bccca3d005ef6d702fe707048ffb6cc2f9453a3ed04cda60b311c'
)
sha512sums_aarch64=(
	'09b1148d9ca601236e0bc37bedb2439e1ccf725396343ed895746e688d095669a8be190b201d1c4129b7dfcef7d80780b525563ce3202c83f24874422d071a8e'
	'9a52b5c9b5df5dd41e13715f81230cc3f282388a63697fe232a3bd917d7e285e7edd88cc12f05b18eb381f293830084efd6b66f3396ebc2ab726bc8c94878fca'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
