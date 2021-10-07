# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.25.0
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
b2sums=(cfc53fb57724a369d4fdaf5b8ddb3febd07939e87ef7eca8af5ea5a52c255e57714e2ed5ba1bb8ff13158cc71b7cc3c6316a2b5de21f50be7bb276ed3a553e3c)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
