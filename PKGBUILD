# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=scriptisto
pkgver=0.6.13
pkgrel=1
pkgdesc="A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages"
arch=('i686' 'x86_64')
url="https://github.com/igor-petruk/scriptisto"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b375422c0ecc85b1df6505417c1bc5350ef79502ac2b396d0bf7a8bd7c2447fc')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

#check() {
#    cd $pkgname-$pkgver
#    cargo test --release --locked
#}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
