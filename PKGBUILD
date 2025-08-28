# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.1.8
pkgrel=1
pkgdesc='Crowdsourcing better titles and thumbnails on YouTube'
arch=(any)
url='https://github.com/ajayyy/DeArrow'
license=('GPL-3.0-or-later')
makedepends=('unzip')
optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
provides=(chromium-dearrow)
install=chromium-dearrow.install
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/ChromeExtension.zip")
sha256sums=('8b5da4ffc17a4ec19d702c71bcf0891261714455671a03e9d6a03a84b24b0537')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
