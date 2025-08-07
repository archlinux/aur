# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.36.2
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=(
	"$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix"
	'vscode-php-debug'
)
b2sums=('e3e886fcfd40099309a4184dc89b0b090af5ebb74c28792940db33d190c9612413fbab62a045465c472782e9e02f710200ec6a9e51401d5369c8042d601a2e85'
        'd22937d8e805829fc267914c201f9a0d61ef4b204fcda5928517c15706f13be479c338aae7c100fb902780042f2bfd0de956d92a87b2535aa4060a97d42d9743')

package() {
	install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
	cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
	install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
	install -Dm755 "$srcdir/vscode-php-debug" "$pkgdir/usr/bin/vscode-php-debug"
}
