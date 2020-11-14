# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20201030.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64')
url='https://gvisor.dev'
license=('Apache')
depends=('docker')
provides=(
	"${pkgname%-bin}"
	"$_pkgname"
)
conflicts=(
	gvisor-git
	"$_pkgname"
)
install="$pkgname.install"
source=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/$_pkgname")
sha256sums=(75fbfaf6c6d5e095b53e298c2d3deec04cd1422d7fa364675e306d2f7bf3a4dc)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
