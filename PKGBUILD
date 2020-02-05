# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=fontfor
pkgver=0.2.1
pkgrel=1
pkgdesc="Find fonts which can show a specified character and preview them in terminal or browser."
arch=('x86_64')
url=https://github.com/7sDream/fontfor
license=('GPL-3.0')
depends=()
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6cce63781393b476a83648a42453ea050e82e7432c3d6f07f1d3e3daddc39166')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dt "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
