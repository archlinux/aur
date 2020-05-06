# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=rargs
pkgver=0.3.0
pkgrel=1
pkgdesc='A kind of xargs + awk with pattern-matching support'
arch=('i686' 'x86_64')
url="https://github.com/lotabout/rargs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('22d9aa4368a0f9d1fd82391439d3aabf4ddfb24ad674a680d6407c9e22969da3')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
