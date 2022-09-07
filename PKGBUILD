# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-clearurls'
pkgver=1.25.0
pkgrel=1
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy"
license=('LGPL3')
arch=('any')
url="https://github.com/ClearURLs/Addon"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://github.com/ClearURLs/Addon/releases/download/$pkgver/ClearURLs-$pkgver-chrome.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('3e5ffa9340f56105ca58b90d71a770985a60d7bfd0e66337226fa6ac416f359a')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > lckanjgmijmafbedllaakclkaicjfmnk.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 lckanjgmijmafbedllaakclkaicjfmnk.json "$pkgdir/usr/share/chromium/extensions/lckanjgmijmafbedllaakclkaicjfmnk.json"
}
