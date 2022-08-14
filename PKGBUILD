# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220808.0
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
	'ccec0f16d0494d1ddfac44ec7614874a5ef012e8a02270f005f169f73af334a40d142d2a766e473bdc7dc3d348f2367e53d9c01e04385b66a21f9f8145f4777e'
	'1886296af99d129b971f0437ae281adeec50a5320b96e14f37c20692d4b5c9920063e665fcf9d422418f3ebd2610310f33f7b37ba859ef71278242cbd8de5fa8'
)
sha512sums_aarch64=(
	'd13323c9d71312d86ac09d35124ab0d28cd6df300e25e33e8146a17a87ecbffb2e6c6dff7e8d261c33028ecc8a36a8685f7053760c6473b61afa703469ed2cb6'
	'36573c27ba1ce33a021cc4aed4e795b2ede553a4feccd9c444e4f7251ef81e0c7eaaac47a19a4dd0436faee1359fc496c45e024bf39988028cddbc0ee9a40b50'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
