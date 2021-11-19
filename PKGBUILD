# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=gvisor-bin
_pkgname=runsc
pkgver=20211115.0
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
b2sums=(7453fb4f4ec503e29f535497783c0c98bc1a7a26325217e696b1f4f4cb1dd6577ecb6d8fa94cda2194d820f3a6e26c68793d0eaff52e3128f07334381089ecc9)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
