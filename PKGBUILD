# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20200127.0
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
sha256sums=('09e970cfca06712488edae1eb7b24a66acb39df1e83e282c0abd755c6ceba4df')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
