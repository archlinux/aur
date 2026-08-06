# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260803.0
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
sha512sums_x86_64=('8f87e9a0ed6bec3a50effed65694d2cc71bfe76c0b5e740dcaa58af5af42d83cd441b44d3505abdf3b79e15052dde842e9981fc22c068c05f9ef92e9215becc9'
                   'e39cc100ef11b6e78a918de8717fb62ace73c5137407dfd92b083264dac9b4f070435fc1f271cd6453b8fdae34cdc01f7fabbe5736bf30af79e389be8ecb424a')
sha512sums_aarch64=('4547ead374aceb85d8659492e7b4a176b900ba98f873e4eab7e877968ffc5a01021c4f809bbb047d2d9498779ffab56d05d79ad4fcfb0e10438cb6779504dc49'
                    '6fdbd646c808d6f8fcf97ebce45244995a117d7d00bab1a1ce3146b1b8dbbc8a11728f715792033f7e62f66af5f766746b230e9570f332a3660a2b2613344dfa')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
