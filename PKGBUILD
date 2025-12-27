pkgname=syca
pkgver=1.5
pkgrel=3
pkgdesc="minimal sudo‑like privilege elevation tool for Linux. "
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/syca"
license=('GPL')
depends=('python' 'python-pam')
makedepends=('gcc')
source=('syca' 'syca-helper.c' 'syca.pam')
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    gcc syca-helper.c -o syca-helper
}

package() {
    install -Dm755 "$srcdir/syca" "$pkgdir/usr/bin/syca"
    install -Dm4755 "$srcdir/syca-helper" "$pkgdir/usr/lib/syca-helper"
    install -Dm644 "$srcdir/syca.pam" "$pkgdir/etc/pam.d/syca"
}
