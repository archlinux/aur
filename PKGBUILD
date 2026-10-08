# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20261005.0
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
	"$pkgname-x86_64-$pkgver.tar.zst::https://github.com/google/${pkgname%-bin}/releases/download/release-$pkgver/${pkgname%-bin}-x86_64.tar.zstd"
)
source_aarch64=(
	"$pkgname-aarch64-$pkgver.tar.zst::https://github.com/google/${pkgname%-bin}/releases/download/release-$pkgver/${pkgname%-bin}-aarch64.tar.zstd"
)
sha512sums_x86_64=('27fed731b432d6a39d908956623fd273979fda66b3ccf4b9c12413ea417c516e18a9dc3cced403fb28efe495d64dce4251f51cf8c4d9f4a72f9833bd96b6bb35')
sha512sums_aarch64=('cb1c1ac7616f1f0e2287d39660aa9a65f1d81b866c7fa29457f78da62373baadda2d55aa96a200743dfe56193e43d2b6256af23a23d41d0b49a49b4971982435')

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
