# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-material-icons-for-github-bin
pkgver=1.8.28
pkgrel=1
pkgdesc='Browser Addon that enhances file browsers of version controls with material icons.'
arch=(any)
url='https://github.com/material-extensions/material-icons-browser-extension'
license=('MIT')
depends=('git' 'unzip')
optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
provides=(chromium-material-icons-for-github)
install=chromium-material-icons-for-github.install
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/github-material-icons-chrome-extension.zip")
sha256sums=('fe2310f5eec279e31db5ead53ad25b1ecabf74646096de4d7e3f1f0cfbb8cb08')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/material-icons-for-github-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/material-icons-for-github-chromium
}
