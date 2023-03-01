# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.200.1'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')
optdepends=('bash-completion: Bash completion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64-v$pkgver.zip")
source=(
	"$pkgname-$pkgver-$pkgrel-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-$pkgrel-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
sha512sums=('50dd81cc39c67bc463e51a2d492119a2533548cb7e3f765e02cf9ada999397710351a1c4deadc4ffc59f4c2347b2e6ba2d4c42cbb63026ef48d50a2f2f5ee87a'
            '3b8288e5dac996da44bd81b0eb1d96905c4b90ad9154f3d29d073c96890b75cd281fa03af0b77f331dbec239d341363b5f9b328bafea0d4b8d0a3e900d150f80')
sha512sums_x86_64=('d2f81d8a4e913d356e0e1613529d8721683004a6cd2a87b97c04a19efbada7cfdc6203adea5651d206fab5899800b19a7c730e8b231af67ba0bafdea4d5c94a0')
sha512sums_aarch64=('cb2aef13feb6e4df5dca936272ae25b5920e04f2244ab4e650bd1e286a58735f944f2b11680cf5d7d115f369ca6960835fd8b24c6ed0f2f18a9c83896c6bf131')

package() {
	cd "$srcdir/"
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
