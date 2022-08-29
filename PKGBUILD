# Maintainer: Mel <mel@nie.rs>
pkgname=quakeinjector-bin
_xtname=QuakeInjector
pkgver=alpha05
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
sha256sums=('9cbc1ed86aab077c91eff024d81cf0341abee6e0f40ea4a9eb7ff7c6f79711ee'
            '24dccb15d1fe176009f1f637172e434553fdef8726e7f42c66307725bccf94bc')

package() {
    install -Dm644 "$srcdir/${pkgname/-bin}.desktop" "$pkgdir/usr/share/applications/{$pkgname/-bin}.desktop"
    install -Dm644 "$srcdir/$_xtname-$pkgver/lib/$_xtname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
}
