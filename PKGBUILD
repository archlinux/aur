# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.22.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/cloudflare/cloudflare-go/releases'
license=('BSD')
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("$url/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.xz")
b2sums=(ed58065d4b3fc9be38e76ed1ce0422a96b0184aa2a4514ae710002bbe12bae30f475110fc181b22b68fae7e40869eff5be1b674038ecd0738e8638ba8c199d68)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
