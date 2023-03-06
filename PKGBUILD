# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=vscode-php-debug
pkgver=1.32.0
pkgrel=1
pkgdesc='PHP Debug Adapter (DAP)'
arch=('any')
url="https://github.com/xdebug/$pkgname"
license=('MIT')
depends=('nodejs')
source=("extension.zip::https://github.com/xdebug/vscode-php-debug/releases/download/v$pkgver/php-debug-$pkgver.vsix")
b2sums=('5e808bf1f7dd63f0d8577762b5773d5ce6d9bdf6a0a9490d051db9dd3a7f972082d72cc44e103489d29657bb3b573a4289f58f2c7c3529f0e169569b7dcc49fc')

package() {
    install -dm755 "$pkgdir/usr/lib/node_modules/php-debug"
    cp -r "$srcdir/extension"/. "$pkgdir/usr/lib/node_modules/php-debug"
    install -Dm644 "$srcdir/extension/LICENSE.txt" "$pkgdir/usr/share/licenses/vscode-php-debug/LICENSE.txt"
}
