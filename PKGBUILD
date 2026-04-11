# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.3.5
pkgrel=1
pkgdesc='Crowdsourcing better titles and thumbnails on YouTube'
arch=(any)
url='https://github.com/ajayyy/DeArrow'
license=('GPL-3.0-or-later')
makedepends=('unzip')
optdepends=(chromium vivaldi google-chrome opera brave)
provides=(chromium-dearrow)
install=chromium-dearrow.install
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/ChromeExtension.zip")
sha256sums=('9213a0c09facb3b0d1229fa4bbdb5313ec23f7a27c09a6b60ee81720b95e37e6')

build() {
    cd "$srcdir"/"$_dirname"
    unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
    install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
    cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
