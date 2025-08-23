# Maintainer: 0xM4LL0C <0xM4LL0C@proton.me>

pkgname=disk_usage-git
pkgver=0.1.0
pkgrel=4
pkgdesc="A tool to monitor disk usage and alert when usage exceeds a threshold"
arch=('any')
url="https://github.com/0xM4LL0C/disk_usage"
license=('MIT')
source=("$pkgname::git+https://github.com/0xM4LL0C/disk_usage.git")
sha256sums=('SKIP')
depends=(
    'libnotify'
)
makedepends=(
    'make'
    'gcc'
)

build() {
    cd "$srcdir/$pkgname"
    make build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/$pkgname/.build/disk_usage" "$pkgdir/usr/bin/disk_usage"
}
