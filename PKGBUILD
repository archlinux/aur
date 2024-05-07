# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240501.0
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
sha512sums_x86_64=('34e11b0a9479adc6a39e8202af6a96c697b044a26ab952c0d225b4d46cbd04248358ed2ab93b6c3f616b1380f8fe59e4d61fe89a42233728bb3decd10e158e85'
                   'a011d53a261d0b9394121c667af1f85e8e02e209fc62e5241c80c69ff98018198984ee32426a2f0e6992b833d960df8f8eeb3991e499f39015536de2d11b5a13')
sha512sums_aarch64=('93ed2233018c14f3b22ab67b43c3bc734139a55d2a30056f1d8be39ca679be618013a850dfe726edb40f5a2394d76d85e5ff56662e8c350f2df656bec28daa8e'
                    '16b07544260a9463e242df5744ecf0e7897d7d7c320c1be002fbb69f482ca897b00672380c097a6af8593c69475e17c6c357848be96f2f6b062e96e8d1ac5bab')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
