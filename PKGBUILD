# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-material-icons-for-github-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='Browser Addon that enhances file browsers of version controls with material icons.'
arch=(any)
url='https://github.com/material-extensions/material-icons-browser-extension'
license=('MIT')
makedepends=('unzip')
optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
provides=(chromium-material-icons-for-github)
install=chromium-material-icons-for-github.install
validpgpkeys=("64CA1EB12E7BE6CF6CEE2C8B8911AFB8DE64BDB4")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/github-material-icons-chrome-extension.zip")
sha256sums=('884a620a2daef825ce54829fb47e2d2237e9b542694770dc4fa8d5c9060fcdb2')

build() {
    cd "$srcdir"/"$_dirname"
    unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
    install -dm755 "$pkgdir"/usr/lib/material-icons-for-github-chromium
    cp -r -- extension-chrome/* "$pkgdir"/usr/lib/material-icons-for-github-chromium
}
