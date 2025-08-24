# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-material-icons-for-github-bin
pkgver=1.10.7
pkgrel=1
pkgdesc='Browser Addon that enhances file browsers of version controls with material icons.'
arch=(any)
url='https://github.com/material-extensions/material-icons-browser-extension'
license=('MIT')
makedepends=('unzip')
optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
provides=(chromium-material-icons-for-github)
install=chromium-material-icons-for-github.install
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/github-material-icons-chrome-extension.zip")
sha256sums=('69f1c422358d54bb55d42e0e99b0f82039d215ea2aaa05685e64f0290eb3bf50')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/material-icons-for-github-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/material-icons-for-github-chromium
}
