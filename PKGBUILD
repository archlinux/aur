# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.3
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
sha256sums=('5cdcaf5836b3ba9cde301cc309a03e2d9c473f69abf85691e86cc723b45d38ad')

build() {
    cd "$srcdir"/"$_dirname"
    unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
    install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
    cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
