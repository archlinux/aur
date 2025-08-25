# Maintainer: kamisaki
# Description: Btrfs rollback tool written in Go for Arch-based distributions
pkgname=btrfs-rollback
pkgver=1.0.0
pkgrel=1
pkgdesc="Btrfs rollback tool written in Go for Arch-based distributions"
arch=('any')
url="https://github.com/axrona/btrfs-rollback"
license=('GPL3')
depends=('btrfs-progs')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axrona/btrfs-rollback/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o build/btrfs-rollback .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/btrfs-rollback "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 btrfs-rollback.toml "$pkgdir/etc/btrfs-rollback.toml"
}
