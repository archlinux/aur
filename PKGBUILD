# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Attenuation <ouyangjun1999@gmail.com>

pkgname=procs
pkgver=0.9.16
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
makedepends=('rustup')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('98a32872bf710a5d821a9764d3ab5863109646937b0205edc1bdca71425195e3')

build() {
    cd "$pkgname-$pkgver"
    rustup override set 1.41.1
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
