# Maintainer: Mel <mel@nie.rs>
pkgname=quakeinjector-bin
_xtname=QuakeInjector
pkgver=alpha06
pkgrel=1
pkgdesc="Download, install and play quake singleplayer maps from the quaddicted.com archive, binary distribution"
url="https://github.com/hrehfeld/QuakeInjector"
arch=(any)
license=(GPL)
depends=(java-environment hicolor-icon-theme)
makedepends=()
provides=(quakeinjector)
conflicts=(quakeinjector-git)
replaces=(quakeinjector)
source=("https://github.com/hrehfeld/QuakeInjector/releases/download/$pkgver/$_xtname-$pkgver.zip"
        'quakeinjector.desktop')
sha256sums=('916397711316cbdf84c48c7bc2c29489417c0788943e8520620bf0c506434e59'
            '24dccb15d1fe176009f1f637172e434553fdef8726e7f42c66307725bccf94bc')

package() {
    install -Dm644 "$srcdir/${pkgname/-bin}.desktop" "$pkgdir/usr/share/applications/{$pkgname/-bin}.desktop"
    install -Dm644 "$srcdir/$_xtname-$pkgver/lib/$_xtname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
}
