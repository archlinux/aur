# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=choose
pkgver=1.3.1
pkgrel=1
pkgdesc="A human-friendly and fast alternative to cut and (sometimes) awk"
arch=('x86_64')
url="https://github.com/theryangeary/choose"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6c44170f456f410370ba31d59bfad1f54a71ba80a79b87debbe235672a2ea0dd')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
