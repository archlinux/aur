# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20211101.0
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
install="$pkgname.install"
source=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/$arch/$_pkgname")
b2sums=(3634917346ae5cf4ec64650214cc8f8948eabd095dbf0475ecd29f34460e0bffbcf5a14fecdbfb5eabdaf02255ded13e53c841f258ca7dd8170e42e362cae02e)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
