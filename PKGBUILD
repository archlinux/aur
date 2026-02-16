# Maintainer: Anthony Habash <bb@hab.rip>
# Contributor: Based on seaglass by alexhulbert

pkgname=bb-darkreader-host
pkgver=0.1.0
pkgrel=1
pkgdesc="Native messaging host for syncing pywal colors with Dark Reader"
arch=('x86_64')
url="https://github.com/anthonyhab/bb-darkreader-host-c"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
options=('!strip')

build() {
    cd "$startdir"
    gcc -O2 -s -o bb-darkreader-host bb-darkreader-host.c
}

package() {
    cd "$startdir"
    install -Dm755 bb-darkreader-host "$pkgdir/usr/bin/bb-darkreader-host"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "==> To complete installation, run:"
    echo "==>   bb-darkreader-host install"
    echo "==> Then restart Firefox"
}
