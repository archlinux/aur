# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20200323.0
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
sha256sums=(bb36104122c52157cc005c7ae5f45478d2a318481e5ac60bddbd11984c5d24d4)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
