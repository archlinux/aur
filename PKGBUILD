# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20210419.0
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
source=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/latest/$arch/$_pkgname")
sha256sums=(de11c5b13c6758443cdc75b7c9973b61045096fd5f0d0d9fa24a8db102798f40)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
