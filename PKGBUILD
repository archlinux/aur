# Maintainer: Igor Shimanogov <shimanogov.in@phystech.edu>

pkgname=nkt
pkgver=0.3.0
pkgrel=1
pkgdesc='command line tool for helping you track and build your notes, todo lists, habits, and more'
url='https://git.sr.ht/~fjebaker/nkt'
license=('GPL-3.0-or-later')
makedepends=('zig')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~fjebaker/nkt/archive/d122e1ef20d5f0f8c1fe2e71955b8276b3888924.tar.gz")
sha256sums=('eb11eb7ef158ff92b38b711259b70b30bfc2a44c062a8da4d267620e85d88487')

build() {
    cd "$srcdir/$pkgname-d122e1ef20d5f0f8c1fe2e71955b8276b3888924"
    zig build -Doptimize=ReleaseSmall
}

check() {
    cd "$srcdir/$pkgname-d122e1ef20d5f0f8c1fe2e71955b8276b3888924"
    zig build test
}

package() {
    cd "$srcdir/$pkgname-d122e1ef20d5f0f8c1fe2e71955b8276b3888924"
    install -Dm0755 -t "$pkgdir/usr/bin/" "zig-out/bin/$pkgname"
}
