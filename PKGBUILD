# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.31.0
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
b2sums=(fdb04fd2815443faf05be9bb242132153bd5cb2b32f2c559f3a50e81c2e15a3845bf0adc02df728af63aa5c41bcd01f9eaa3bc692f66ee02acf84288caea00dd)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
