# Maintainer: Nazar Mishturak <nazarmx@gmail.com> 
_binname=step-cli
pkgname=$_binname-bin
pkgver=0.8.1
pkgrel=3
pkgdesc="A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc."
arch=('x86_64')
url="https://smallstep.com/cli"
license=('MIT')

source=(
	"https://github.com/smallstep/cli/releases/download/v${pkgver}/step_${pkgver}_linux_amd64.tar.gz"
	"https://github.com/smallstep/cli/raw/v${pkgver}/LICENSE"
	"https://github.com/smallstep/cli/raw/v${pkgver}/autocomplete/bash_autocomplete"
	"https://github.com/smallstep/cli/raw/v${pkgver}/autocomplete/zsh_autocomplete"
)
sha256sums=(
	'8ccec7cef0a0455179b1e092fc54b357cd2c8e7e2d3e37e99b35c96aec0389c8'
	'18fbbca2e27d445e5c08ba493c3dd0c2c2eb991fa22033b8615a7b95ea34179a'
	'add3e078e394e265f6b6a3bf12af81cc7897410ae5e6a0d4ee7714a5b856a7be'
	'1ef3da03d7d728568b163d706bdcfadbc67bb254ce2da615ec1367e437146fad'
)

package() {
	install -Dm755 "step_$pkgver/bin/step" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "step_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "bash_autocomplete" "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "zsh_autocomplete" "$pkgdir/usr/share/zsh/site-functions/_${_binname}"
}
