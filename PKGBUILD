# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.4.1
pkgrel=2
pkgdesc='Automatically synchronise your packages with a file'
arch=('any')
url="https://github.com/ca-cl2/$pkgname"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d2a46125e652022fc9070dafddf1f95d3c7e3fbd723964b0c78c632a1993185')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "$pkgname.hook" -t "$pkgdir/usr/share/libalpm/hooks"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
