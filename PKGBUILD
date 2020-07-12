# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.9
pkgrel=1
pkgdesc="DNS proxy as ad-blocker for local network"
arch=('x86_64' 'i686')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('07a969721ee82ba22d1a95759f5fb33f07fa578341dc4d11ab354f1f436f1664')

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
