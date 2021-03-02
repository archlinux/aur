# Maintainer: tooraj taraz <tooraj.info@gmail.com>
pkgname=skywalker
pkgver=0.2.1
pkgrel=1
depends=(libpcap)
makedepends=(rust cargo)
pkgdesc="simple port and packer sniffer written in rust."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/toorajtaraz/skywalker"
license=('GPL-3.0')
source=($pkgname-$pkgver.tar.gz::https://github.com/toorajtaraz/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
    return 0
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
