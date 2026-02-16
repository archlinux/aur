# Maintainer: anthonyhab <bb@hab.rip>
# Contributor: Based on seaglass by alexhulbert

pkgname=bb-darkreader-host
pkgver=0.1.0
pkgrel=2
pkgdesc="Native messaging host for syncing pywal colors with Dark Reader"
arch=('x86_64')
url="https://github.com/anthonyhab/bb-darkreader-host"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anthonyhab/bb-darkreader-host/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -s -o bb-darkreader-host bb-darkreader-host.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bb-darkreader-host "$pkgdir/usr/bin/bb-darkreader-host"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "==> To complete installation, run:"
    echo "==>   bb-darkreader-host install"
    echo "==> Then restart Firefox"
}
