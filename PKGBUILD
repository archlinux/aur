# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220704.0
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
	'4d2f7c157b93d4f4ad4c03eef5bc6fd80173f8a11c2764035ea2b8c54062b21fb97d5b5f6996009842e841d9bc137e90697da6a56816335063579024bb5a36b9'
	'2e5f7c182f67326845f2f93e2051188ef6909cadb1f9d87df3c19bd8d527ae4596534a9b41b67c712c046eb422c20265c9bed8e6cde9413df81c698038158ac9'
)
sha512sums_aarch64=(
	'4d460a59552dcbcf11d969030e2aad6a520ef88b4d6c2818dc3a2e8a2a276615cc08efceae35e60044b739be2285289c12022ba3278e431606331f7cebecde72'
	'dc2f8814ec30fc172e6ca86471918650c57ed106798b0f9164517ceb74653102387e8aadc547be0a9712f842053d63f1f4296d48d51aa1aa569cc8e2f1d59c80'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
