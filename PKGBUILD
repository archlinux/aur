# Maintainer: Ty Smith <https://github.com/tyvsmith>
# Template. `make pkgbuild VERSION=X.Y.Z` renders dist/aur/PKGBUILD from it.
pkgname=hypr-sticky-hdr
pkgver=0.1.0
pkgrel=1
pkgdesc="Keep a Hyprland monitor in HDR for as long as an HDR window lives"
arch=('any')
url="https://github.com/tyvsmith/hypr-sticky-hdr"
license=('MIT')
depends=('hyprland>=0.56' 'lua')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c9fa57aa2c682379babf5d97243780471252fe230a5d0c37997d529f828603e6')

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
