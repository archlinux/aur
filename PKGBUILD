# Maintainer: 0xM4LL0C <0xM4LL0C@proton.me>

pkgname=disk_usage
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to monitor disk usage and alert when usage exceeds a threshold"
arch=('any')
url="https://github.com/0xM4LL0C/disk_usage"
license=('MIT')
source=("https://github.com/0xM4LL0C/disk_usage/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
depends=(
    'libnotify'
)
makedepends=(
    'make'
    'gcc'
)

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    make build
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 "$srcdir/$pkgname-${pkgver}/.build/disk_usage" "$pkgdir/usr/bin/disk_usage"
}
