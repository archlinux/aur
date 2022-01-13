# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.30.0
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
b2sums=(5ef7b7c0c178b93510c4bb64408c9cb6a5e4e9dffde49acf1901d62b61edd129a471627007498ef79fcfc2ef5aff3b556e27afceb03bf7ec7641a5fc0dc4f9c1)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
