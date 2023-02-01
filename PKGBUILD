# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=scriptisto
pkgver=2.0.1
pkgrel=1
pkgdesc="A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages"
arch=('i686' 'x86_64')
url="https://github.com/igor-petruk/scriptisto"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('893a06d5349d2462682021f1e053488b07a608eee138dfcc9e68853223d48b81')

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
