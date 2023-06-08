# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230605.0
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
	"$_pkgbin-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgbin"
	"$_pkgshim-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgshim"
)
source_aarch64=(
	"$_pkgbin-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgbin"
	"$_pkgshim-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgshim"
)
sha512sums_x86_64=('b96374f8b5a13c5fd51097cc16032b55241e2a0c6d286657d9a1ca7198be2b587d85aa595b69527858121cda63e1cde5cfb49fb57864d2c320ce356c4271f4f6'
                   'e3555d7be221a855148e1a4aec81a9ba217c31cd2d83bb35108eeb98b332f1df22eca2fdaaeff82a6cd452046aa72ccc8800890b2ee1a85497862ffd2c8158fb')
sha512sums_aarch64=('d959d727e78769d4f1bb2b7c15a557df02611b3bc7349fae02416d206403c5f5e442bcbd60389498fe5bcce4eb7d23385294bacfbd845eeda3746e4cdd681de2'
                    'a1f7288e8d6301ccfe97f4d28aa44d429535e3a577c6b9db32553f2b82b27eb08763ba8232b92c77445418c474d0df7fbf06f6fd24b3da82a7e0ecfc455e3f11')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
