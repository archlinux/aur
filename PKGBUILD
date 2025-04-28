# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.0.9
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
sha256sums=('63523b03d27f434118374afc33a69e9441c3a31d1afeb54e3d9a508a66dfe566')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
