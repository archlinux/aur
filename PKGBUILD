# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=choose
pkgver=1.3.0
pkgrel=1
pkgdesc="A human-friendly and fast alternative to cut and (sometimes) awk"
arch=('x86_64')
url="https://github.com/theryangeary/choose"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('95889215c57e3be9ea14b929f8a09858c740b1e78c608c2096812ce420eb099a')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
