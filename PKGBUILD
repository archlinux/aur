# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.11
pkgrel=1
pkgdesc="DNS proxy as ad-blocker for local network"
arch=('x86_64' 'i686')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6c7f6f701e14202582803a9cf6e0c81c17a42b0edd701927d7b7886ce7a12c4d')

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
