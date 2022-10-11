# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.29.0
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=("extension.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix")
b2sums=('b5fad709d0d7b3f07c1313246eda137304a42820e8c492a83fb4fc417e87a2db81e960a9645ee1abe18b7f0d7800ad391b28a99723b18b664ad7b1bc32ba4741')

package() {
    install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
    cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
    install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
}
