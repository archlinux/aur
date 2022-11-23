# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.4
pkgrel=1

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('rust-nightly' 'cargo-nightly')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c45f4ee0093a0e5663a513f2469b03a5320a8c1fb3fd1d2419733e4a6145404')

build(){
    cd "$pkgname-$pkgver"

    cargo build --release --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
