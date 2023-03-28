# Maintainer: Robert Štětka <robert.stetka@gmail.com>
pkgname=ehh
pkgver=1.1.1
pkgrel=1
pkgdesc="Remember linux commands"
arch=('any')
url="https://github.com/lennardv2/ehh"
license=('MIT')
depends=('python-colorama' 'python-click' 'python-yaml')
source=(
	"https://github.com/lennardv2/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-LICENSE::https://raw.githubusercontent.com/lennardv2/ehh/main/LICENSE"
	"_ehh"
)
sha256sums=(
	'5a6bc3a9c3ba20080cf666cc51e6006fddb16bcae449d0e4a0cb5aa592ce299e'
	'SKIP'
	'SKIP'
)

package() {
	cd "$srcdir"

	install -Dm755 "$pkgname-$pkgver/$pkgname/cli.py" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 $pkgname-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
