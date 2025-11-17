pkgname=syscall
pkgver=1.2
pkgrel=2
pkgdesc="Sudo-like tool using PAM authentication with system-wide user cache"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/syscall"
license=('GPL')
depends=('python' 'python-pam')
makedepends=('gcc')
source=('syscall' 'syscall-helper.c' 'syscall.pam')
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    gcc syscall-helper.c -o syscall-helper
}

package() {
    install -Dm755 "$srcdir/syscall" "$pkgdir/usr/bin/syscall"
    install -Dm4755 "$srcdir/syscall-helper" "$pkgdir/usr/lib/syscall-helper"
    install -Dm644 "$srcdir/syscall.pam" "$pkgdir/etc/pam.d/syscall"
}
