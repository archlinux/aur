# Maintainer: DucktectiveCZ <ducktectivecz@seznam.cz>
# Contributor: DucktectiveCZ <ducktectivecz@seznam.cz>

pkgname=batteryctl
pkgver=1.1.0
pkgrel=2
pkgdesc="An open-source Rust-based command-line tool for interacting with batteries."
arch=('x86_64')
url="https://github.com/DucktectiveCZ/batteryctl"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('cargo')
source=("git+https://github.com/DucktectiveCZ/batteryctl.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/batteryctl "$pkgdir/usr/bin/batteryctl"
}
