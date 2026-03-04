# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260302.0
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
sha512sums_x86_64=('67c0125cc0e3b2633c2557ab0d76f1f15f9fe7b47db77b5a0c4d1e025b184c3f10803b88109948378995cf72068a5d486b05bac8f7a69ca77bf38460ae43ccdc'
                   '7b0cbc9130b4f2fdffe45d0f811070a868bbcdafc9cc30264108ee35fa17ee3a54f1a1c7775619c6afa4b7fc623bd4acf0e80f4fb40fbc7f1f58a1cceb8a9f83')
sha512sums_aarch64=('1f5a81cd6080252d4bee22e0828ed796b438bc768b0845015457944ca659b37fa5a2c22acdf655963b1a27855d5bb2263887463238eaf930efb55b0e4ca801ed'
                    '9bdc7ed0fe570223e6a60368d75e19dd2b211d1b4f84cfbc3d466b0be8b028ba75f49bd9b97e2836ab30140ef2910aec81bebdc444ae9e83805236e5e165b0a9')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
