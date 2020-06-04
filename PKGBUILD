# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.8
pkgrel=1
pkgdesc="DNS proxy as ad-blocker for local network"
arch=('x86_64' 'i686')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f63e0fd771d06b725dcd50aacf1629b8b23cf919a78b23e78562db2df9ac317a')

build() {
    cd "$pkgname-$pkgver"
    make build
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=4 sw=4 et:
