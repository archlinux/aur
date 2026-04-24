# Maintainer: cursed <paradoxtools@proton.me>

pkgname=rain-ascii
pkgver=0.1.0
pkgrel=1
pkgdesc="Comfy ASCII rain for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/cursssed/rain"
license=('MIT')
depends=('ncurses')
makedepends=('make' 'gcc')
conflicts=('rain')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b1e77b12fedc54c1d5d5720dda677c2228ceff184deb51aa7ef0718fb01ce27')

build() {
    cd "rain-$pkgver"
    make
}

check() {
    cd "rain-$pkgver"
    make test
}

package() {
    cd "rain-$pkgver"

    install -Dm755 rain "$pkgdir/usr/bin/rain"
    install -Dm644 rain.conf.example "$pkgdir/usr/share/doc/$pkgname/rain.conf.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
