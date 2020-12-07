# Maintainer: tooraj taraz <tooraj.info@gmail.com>
pkgname=skywalker
pkgver=0.1.2
pkgrel=1
depends=(libpcap)
makedepends=('rust' 'cargo')
pkgdesc="simple port and packer sniffer written in rust."
arch=('i686' 'x86_64')
url="https://github.com/toorajtaraz/skywalker"
license=('GPL-3.0')
source=($pkgname-$pkgver.tar.gz::https://github.com/toorajtaraz/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('358918905fae26a6c4fc7c22f4138dd1')

build() {
    return 0
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --target  x86_64-unknown-linux-gnu --release
    cp target/x86_64-unknown-linux-gnu/release/skywalker $pkgdir
}
