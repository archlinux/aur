# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220627.0
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
	'f782c80ef9ed35ae488150f4784995358dd8935b0197cae1f90b7519c555a7b61ed73a36bd29e98cca97182b7acf65382eb9e8694db29731255fc0063fab9a71'
	'c3199796fc722f90296d8b70e6d7cc633759087c7581772d4eb297b58922d8e756e82122c03d0f942bf8f086c280d032a1198777e2140952d7743177fc35b760'
)
sha512sums_aarch64=(
	'2a3375a7e816e715205252d4b509a09723ae2ba39663eaf2a57ffbb7bba8886cdb6cc1c47b949452552450dcbec3e081f4ae9330d16ce4bc1db98de8563a0849'
	'122e2bbe696324f0a64ab7045a0f3ea9131d98fa8c8ed0856dbec8a60169a98c43936d00e888b90830b9e2c0cbe7ab937cecec260569a411fd618ce0ffcefffd'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
