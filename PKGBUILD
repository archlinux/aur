# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.0.8
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
sha256sums=('e34b33f385c4df75931c48e9a748e78fd2f04f861b1ba411b0c3a96a7195a28c')

build() {
	cd "$srcdir"/$_dirname
	unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
	install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
	cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
