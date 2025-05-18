# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.36.1
pkgrel=4
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=(
	"$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix"
	'vscode-php-debug'
)
b2sums=('c66e21cb1bb2b7425d839c138b56efc18409e8188b56b68e75df14e348e64a176c0f0e383709a74bd53a4caa38528c33924edcc8816834d3bcd90947083b02ab'
        'd22937d8e805829fc267914c201f9a0d61ef4b204fcda5928517c15706f13be479c338aae7c100fb902780042f2bfd0de956d92a87b2535aa4060a97d42d9743')

package() {
	install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
	cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
	install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
	install -Dm755 "$srcdir/vscode-php-debug" "$pkgdir/usr/bin/vscode-php-debug"
}
