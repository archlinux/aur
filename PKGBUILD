# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220425.0
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
	'3306db84b97e617d10021dde12ff0d6670d8579e997c5f57fd18cbcba033b4ff0a458ce1e766f3a14fd76919606ef1cf03b1c945317e56e8452c1c857e8954e5'
	'f04031360b6e6c2817b7a83f139a98ae2c7d8093d9eeab61870e7ee0eb8b3067d7e9d66ef9003db4263e1475bf7438dd42f494695a4b3b92e947ae0ca946901e'
)
sha512sums_aarch64=(
	'53f81d2b6d52eb85b9fb936b6088455ed28fd330cb720c6c47a086504c6ed78323fabf417452b52e30c7a9b14bc9b34d51b0263daa5d126e01967ae849878fa7'
	'096f13ebc96bab22676c78196fd81dce0404d186109607ea3e68e98cd1c2a0edbb5c84da1280d047abf18675d65209a9ad06e746d5e0d849433917b071d2198e'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
