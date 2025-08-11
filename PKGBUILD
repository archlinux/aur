# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250804.0
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
sha512sums_x86_64=('c9572008a35e812277b158933e7f549b734ac0e52349398067f3de1bd42572dee6a0911e85d2737b33e8adbf94515b630d57936058cdbb199b02a290a906ae5b'
                   '474113f2c6454738b276023e96548f4fa1bb84017160bf06bb0aa2c6c5b27c12fd1d5fa0d5f9c39e0e91ccbb69525b303018a13b24eec18c3139db94128c0a74')
sha512sums_aarch64=('18c66aff5fa090f7929c57a30157b577ec5322718693caa4d9fb404e13ab531e0e77fc55ad3470217b3808ee68876670f38ec950147d9ac13857ded758f09528'
                    'a6f7c8e76969588de24f75965ddfb62eec592d03f1882bfb746d7cf7a8a86949f8f441a4a063d7a5c766e6cf576c8d2b9ca7a1918de4902d1053938b6cc382c0')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
