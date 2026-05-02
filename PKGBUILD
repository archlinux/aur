# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=rosie
pkgver=0.1.3
pkgrel=1
pkgdesc="A robot helper for agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/matthewp/rosie"
license=('BSD-3-Clause')
depends=('curl' 'libarchive')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthewp/rosie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a33f09c2c30615995d61641445a6c56d268e2d365be79cf49f6fd5b25676552c')

build() {
    cd "$pkgname-$pkgver"
    make release
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
