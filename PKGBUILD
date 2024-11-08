# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20241104.0
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
sha512sums_x86_64=('cc7377e0edc89e1dc11b6c4b678ebc3df4f356baa6a0bf73b78fbb1483694b378592b731b7b27900cc0035ed747d6b35449cdce25bfb7e3a5be3bb11806cf5f7'
                   '955254fba6c8199d6ee20aac2b7c0fde3aa97a752a827a7ef26d34f2e3ea5cdf27cb78648413dbc03e4278a5828c7a43240c6a5b2656029c62778fbee9e7c22c')
sha512sums_aarch64=('89cc1914b390e206cfd60ece8987338f501e35b771e9d55f775a392508c1c371119a937f0bd6c76857a60f73010b29f4baf124b1047d57e0a8bdbfb046cfba45'
                    'c24f4ba4a08eb8025d204cf83cb0bbdb72913ac63a5e91f600e66c3fcdb7f97817056e8c9045a3d47187da88f59e27bf417e92fbb12b593d42c633e1f895fb24')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
