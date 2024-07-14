# Maintainer: Kushagra Sharma <tda@thedarkartist.in>
pkgname=tda
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple rust program to put 'TheDarkArtist' to the console"
arch=('x86_64')
url="https://github.com/TheDarkArtist/tda"
license=('MIT')
depends=(
  'git'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TheDarkArtist/tda/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
