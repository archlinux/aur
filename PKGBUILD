# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=chromium-dearrow-bin
pkgver=2.3.4
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
sha256sums=('dce4a1492b75a8c83301200dd5a349ea20d53a3778336d2a23cee68a15e46b4e')

build() {
    cd "$srcdir"/"$_dirname"
    unzip $pkgname-$pkgver.zip -d extension-chrome
}

package() {
    install -dm755 "$pkgdir"/usr/lib/dearrow-chromium
    cp -r -- extension-chrome/* "$pkgdir"/usr/lib/dearrow-chromium
}
