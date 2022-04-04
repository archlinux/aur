# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-clearurls'
pkgver=1.24.1
pkgrel=1
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy"
license=('LGPL3')
arch=('any')
url="https://github.com/ClearURLs/Addon"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://github.com/ClearURLs/Addon/releases/download/$pkgver/ClearURLs-1.12.4-chrome.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('5bcda98737dd9e447fff159e736c5acebba27267d4062a9c6d74992d830d51d3')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > lckanjgmijmafbedllaakclkaicjfmnk.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 lckanjgmijmafbedllaakclkaicjfmnk.json "$pkgdir/usr/share/chromium/extensions/lckanjgmijmafbedllaakclkaicjfmnk.json"
}
