# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=onetun
pkgdesc="Access your WireGuard network from any device, without root access or having to install WireGuard locally."
pkgver=0.2.1
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/aramperes/onetun"
license=('MIT')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3e5e025104be2c601a7b4d528adae0b0fc98ff99f098d5b5d8d6a6ae70d61d58')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    install -Dm755 "target/release/onetun" "$pkgdir/usr/bin/onetun"
}
