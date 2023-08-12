# Maintainer: Max Bossing <infi@maxbossing.de>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wifi2qr-git
pkgver=21.2087871
pkgrel=1
pkgdesc="A simple script to share your computer's WiFi connection via QR code"
arch=('any')
url="https://github.com/dlenski/wifi2qr"
license=('GPL3')
depends=('networkmanager' 'bash' 'qrencode')
provides=('wifi2qr')
conflicts=('wifi2qr')
source=("$pkgname::git+https://codeberg.org/maxbossing/wifi2qr")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 "wifi2qr" "$pkgdir/usr/bin/wifi2qr"
}
