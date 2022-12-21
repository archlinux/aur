# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.196.2'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64')
url="https://$_pkgname.org"
license=('MIT')
optdepends=('bash-completion: Bash completion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname-$pkgver-$pkgrel.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip"
	"$pkgname-$pkgver-$pkgrel-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-$pkgrel-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
sha512sums=('33637a607f4fb1b0141f737810ffe1f471ad2b690d8ddd89a9f96aa747c8d6671fc90697c3fd8c067f05c5f7c7e387a5b8e986389fa9dfea2321f64a72a826d2'
            '50dd81cc39c67bc463e51a2d492119a2533548cb7e3f765e02cf9ada999397710351a1c4deadc4ffc59f4c2347b2e6ba2d4c42cbb63026ef48d50a2f2f5ee87a'
            '3b8288e5dac996da44bd81b0eb1d96905c4b90ad9154f3d29d073c96890b75cd281fa03af0b77f331dbec239d341363b5f9b328bafea0d4b8d0a3e900d150f80')

package() {
	cd "$srcdir/"
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
