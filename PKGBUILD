# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgname='runsc'
pkgver=20220103.0
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
b2sums=('6467bc8c1b84b506eea6aba810725a4d9885c4f278146407f881cbb8cb227075a278071cc08a0bee7a6b661594d06a92795b3cdf62eb96eefbf0d053ecb76dcd')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
