# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20201019.0
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
sha256sums=(e7aeef3fc102f42bb6af37dd1c05f1970c86d24a220e299ce7f683d4dcc135c7)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
