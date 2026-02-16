# Maintainer: Anthony Habash <bb@hab.rip>

pkgname=bb-pywalfox-host
pkgver=0.1.0
pkgrel=1
pkgdesc="Native messaging host for syncing pywal colors with Pywalfox (C version)"
arch=('x86_64')
url="https://github.com/anthonyhab/bb-pywalfox-host"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
options=('!strip')

build() {
    cd "$startdir"
    gcc -O2 -s -o bb-pywalfox-host bb-pywalfox-host.c
}

package() {
    cd "$startdir"
    install -Dm755 bb-pywalfox-host "$pkgdir/usr/bin/bb-pywalfox-host"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "==> To complete installation, run:"
    echo "==>   bb-pywalfox-host install"
    echo "==> Then restart Firefox"
}
