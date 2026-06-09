# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

pkgname=vtlock
pkgver=1.0.0
pkgrel=1
pkgdesc="Block VT switching while X11/Wayland screen lockers are active"
arch=('x86_64')
url="https://hub.darcs.net/stef204/vtlock"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'unzip')
source=("$pkgname::https://hub.darcs.net/stef204/vtlock/dist")
install=vtlock.install
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    gcc -O2 -Wall -o vtlock vtlock.c
}

package() {
    cd "$pkgname"
    install -Dm 755 vtlock "$pkgdir/usr/bin/vtlock"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/vtlock/README.md"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vtlock/LICENSE"
}
