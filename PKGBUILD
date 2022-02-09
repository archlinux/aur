# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgname='runsc'
pkgver=20220208.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64')
url='https://gvisor.dev'
license=('Apache')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
	"$_pkgname"
)
conflicts=(
	"${pkgname%-bin}-git"
	"$_pkgname"
)
source=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/$CARCH/$_pkgname")
b2sums=('9238010bca4a4330ae607cb2f09729f1b9aea8107a62809b7e2b68d910ea2f39055cfc6fe486397dc2eb50e39392122e264cf4def29b8296032b48f38e8b1502')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
