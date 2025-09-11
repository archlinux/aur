# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgname=totpm
pkgver=0.1.2
pkgrel=1
pkgdesc="A TPM-backed command line TOTP/2FA client, using fprintd for user presence checking."
url="https://github.com/koditoriet/totpm"
license=("MIT")
arch=("x86_64")
makedepends=('rust')
source=("https://github.com/koditoriet/totpm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("eed4e1c8f13908731dc11ed667765652bc176ac30afa478f81056c1434f750ba")

build() {
    cd totpm-$pkgver
    cargo build --release
}

package() {
    cd totpm-$pkgver
    install -Dm755 target/release/totpm -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
