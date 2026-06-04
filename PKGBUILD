# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260601.0
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
sha512sums_x86_64=('27ade75278e3ee7d8ff1b1cdd979383f8beca2327a2a572d054280b43a5a6db615db6387fa82b230839fed30c9a0c65ac249195a81b51298e639ef1262182640'
                   '5b502b951bfd80666ad628d6f68ebe5a888d986163db9efc6647b07b26eac95e108367648d642b5d4dc8c44b631de55b7ea35e737d620d3b88e636fe11cd20e3')
sha512sums_aarch64=('e2a6c39afa478e4040e8b2a803324011fb81ee268fdac5cd005f64e165218b3a45e45ba9cef15fcf7f514e80da13b752ce2733d035d6dcded48c89a468d4fd17'
                    '1ffd9edb4d200661d1b6b85dd07dab02ec71e211909a20fe61a96ce554fcb03494378f10ca226c5c345afaf039902675959fb06eeafbde693acc63967d0d7cc9')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
