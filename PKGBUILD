# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.36.0
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=("extension.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix")
b2sums=('b8fe1622cebd320aa01bed76a28a6230619af5158ef1a5932440d004dff14478c86e127b8f4f92e6db8a546b91278def0567dd9ec852767430fdf5bc68a8ba9a')

package() {
    install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
    cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
    install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
}
