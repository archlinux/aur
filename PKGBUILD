# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20201130.0
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
sha256sums=(87c9635b95c624297f4e279bfcd6e2277d9230f1cc3b5e5749896d0594290114)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
