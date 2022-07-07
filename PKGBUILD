# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=neomutt-logo
pkgver=20220429
pkgrel=2
pkgdesc='Neomutt logos for use with xdg-desktop-icon'
url='https://neomutt.org/'
license=('GPL')
arch=('any')
depends=()
makedepends=('git' 'gnupg')
_github='https://github.com/neomutt/neomutt'
source=("$pkgname-$pkgver.tar.gz::$_github/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$_github/releases/download/$pkgver/$pkgver.tar.gz.sig")
sha256sums=('45496542897ba8de6bc7cce3f5951d9033ed1c49e5d6f1353adaeefe795d9043'
            'SKIP')
validpgpkeys=('86C2397270DD7A561263CA4E5FAF0A6EE7371805') # Richard Russon (flatcap) <rich@flatcap.org>

package() {
    cd "neomutt-$pkgver"
    for size in 32 64 128 256
    do
        install -Dm 644 "contrib/logo/neomutt-$size.png" \
            "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/neomutt.png
    done
    install -Dm 644 "contrib/logo/neomutt.svg" \
        "$pkgdir"/usr/share/icons/hicolor/scalable/apps/neomutt.svg
}
