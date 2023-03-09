# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230306.0
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
sha512sums_x86_64=('48e2bc01c56a33a100c4f7141b9bd46d7d99116c9098265b5d27ab494e6076ed81580bdf5c8efae8c3afe13625d47ef56099259c06bc6fcef6694986da0841f7'
                   '91aef8fe51301414f09e143de81b0f063fca060a666b18db1b5b931d0b4dfd63a84eea652a29e5a95ecae47249f520de6ae892168a6421be457c9917331a162a')
sha512sums_aarch64=('ff4e89cbb36af870679e0549f0d56a4daba074d0ff312155daf316ea55504f80ee568dadf75623fc8d2b95eff59a4bc8375429e5961156af72a68c56e714c00f'
                    'cbad3cd0d5921f530a551f95d09d386b574cc45e2c59ce6c85443d8fe47fb5a9f92c329a50801aa24ccb930bc887f32d15d28a0b3a2fb63fce499c9fcfe7bdd8')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
