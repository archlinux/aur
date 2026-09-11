# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260907.0
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
sha512sums_x86_64=('0849716f43562ddc4730cd590e278c1210067f1b8ef05b8b8fa1dd293d4581fc349a365527cc189eea5890d8432867132f0e7854891b2d0e39dbec792fa0dfb5')
sha512sums_aarch64=('05de7fdb8364063f18c5ce0b191ac9147ea5cd26dfb5ad6e34f742bfa6db86fa6defcda2c6e20e55ecfa9d587772d2f024e1d70241c10c96da8d7f52936b8faa')

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
