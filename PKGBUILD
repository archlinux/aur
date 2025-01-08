# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20250106.0
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
sha512sums_x86_64=('fe434dc9ddfeaf2e333c0c77d7946012c20a09f125d6bfa9a08c54dd9c237f0da791c5c0e8db4052fd45f2f74a95196292f64824d98e9824aa394c631b534b09'
                   '017a687fe2a23f7d9c457bab389a47c442a477d5da6e607c809601cf928ab3fc4e2b538c449b7038c88b28b6f36d146c573d74a7fb6b0a9dafe0cea955a9a965')
sha512sums_aarch64=('6165ceaed325e4e325b3ff4f312e03ecfb60f577b7a01a4cf3be6dc58bc4294e54569c18543278c022a337eb06a55d25dc0ac3f237c56def23d5e7145ddc0edd'
                    '0b75574ec22cc79dc22b962113c6648919111b65fad9d10f804cbf4543afb116e6158eecb1ced5b41a59450f4045077f670ee3465d5298981861f1bda2221ca1')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
