# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20210712.0
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
b2sums=(757c2df8f379b525b485fa4a5c6f00fdab3913cccc41f8db6499f940aa524e2f9d82820d72488dd3aa51b496b3670b23e69d53d139b2f245b09cb0b1e44e07d2)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
