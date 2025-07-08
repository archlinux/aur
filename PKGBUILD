# Maintainer: Jacob Komissar <dev dot i at komissar dot net>

pkgname=ttf-bootstrap-icons
pkgver=1.13.1
pkgrel=1
pkgdesc="TTF version of Bootstrap's icon font."
url="https://icons.getbootstrap.com/"
license=('MIT')
arch=('any')
makedepends=('woff2')
source=("https://github.com/twbs/icons/raw/refs/tags/v$pkgver/font/fonts/bootstrap-icons.woff2"
        "font-LICENSE::https://github.com/twbs/icons/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('6c75710364a1ca5604267716f6d28997b26319fdb078cf11e0b42ab66ff2ea61'
            '0fb3e11bd57e896c5a512afd64864d28a37de45d19835016c87ca1ad19ead969')

build() {
    woff2_decompress bootstrap-icons.woff2
}

package() {
    install -Dm644 font-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" bootstrap-icons.ttf
}
