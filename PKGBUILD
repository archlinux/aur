# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220713.0
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
	'e2f9a7470eb3761b88fb32a00690652053a3d1b41e82a56e2046d39d7302a1845774deacb3898220e921a729f19ef86881812c0e9148daef981b19a3a5d7cade'
	'0eb173dbb220eaecb489d4ec045b898e2aa1373b71b05fd402ec2aaf24a05a4ae6c37e30a5108b9f189977d8e4f455687e3a17c652bcf85a200310b811473316'
)
sha512sums_aarch64=(
	'31d9d595d4c70fb6300fa003f9f4baec0c17e6f0aef3796e191a02d8b3166afdce907bde6858ede7a1118b3898c9213ce4194a4cafbc74ce420fee44cf97090b'
	'0e0998ab5657737ffc765bba5948ef471cd6a3b8b1070914e744661dc2d9951bc516bc39c2874b81c0cf853a120f903721500892cd367bf0fd61f44fa0db37d1'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
