# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.29.0
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
b2sums=(05957d16a118d2f4669c460ee0eca492666dae320748179463d10e248b1c781fa01735debe191e9c114f08baca138c48fa2ae72d7b536a1c81c3d04543c96e3f)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
