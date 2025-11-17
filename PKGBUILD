# Maintainer: raincandy
pkgname=syscall
pkgver=1.0
pkgrel=1
pkgdesc="minimal sudo‑like privilege elevation tool for Linux."
url="https://github.com/0xraincandy/syscall"
license=('GPL')
arch=('x86_64' 'aarch64')
depends=('python' 'python-pam')
makedepends=('gcc')
provides=('syscall')
conflicts=()
source=('syscall' 'syscall-helper.c' 'syscall.pam')
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    gcc "$srcdir/syscall-helper.c" -o "$srcdir/syscall-helper"
}

package() {
    install -Dm755 "$srcdir/syscall" "$pkgdir/usr/bin/syscall"
    install -Dm4755 "$srcdir/syscall-helper" "$pkgdir/usr/lib/syscall-helper"
    install -Dm644 "$srcdir/syscall.pam" "$pkgdir/etc/pam.d/syscall"
}
