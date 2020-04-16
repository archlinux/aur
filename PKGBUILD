# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.6
pkgrel=1
pkgdesc="DNS proxy as ad-blocker for local network"
arch=('x86_64' 'i686')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e99f9480b9efb0e06b33df686cfabb25bea0220f48e68eb0efe107f11caf785c')

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
