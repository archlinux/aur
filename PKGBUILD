# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.35.0
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=("extension.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix")
b2sums=('2935ea2dd26adad0cf5ae562a0915845a3ca7613cbf23fc89f040a544f2d48cb268ae13388e3c3695b1347374b29923fd23bf59131e58d5a00dc7cbec85f1b98')

package() {
    install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
    cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
    install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
}
