# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20210518.0
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
	"${pkgname%-bin}-git"
	"$_pkgname"
)
install="$pkgname.install"
source=("$pkgname-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/$arch/$_pkgname")
b2sums=(7983fc051ed641d13b1ac3039a764ca0cb6af3c3e007bb682c6d7d8aad7d29483f3cebc6fae913e3832b08d2a8f36194a4e2ccbbc0418f25275137655f9944b8)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
