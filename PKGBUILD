# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-material-icons-for-github-bin
pkgver=1.10.8
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
sha256sums=('6b215cb19ccc268bf9f4b2017acd0cce8250c256869516ceaa97b84a6bedc6df')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/material-icons-for-github-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/material-icons-for-github-chromium
}
