# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.32.1
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=("extension.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix")
b2sums=('480d3867ee9bf2bf65fad21ddcb2ab9c58aba4eec8647ac27af6e372f81fce3d463efe6e8ecc99579345bee411ac1f82012449f41b82e41c01165c5c0f482050')

package() {
    install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
    cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
    install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
}
