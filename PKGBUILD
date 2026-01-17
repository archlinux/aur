pkgname=syca
pkgver=1.6
pkgrel=4
pkgdesc="Minimal sudo‑like privilege elevation tool for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/syca"
license=('GPL')
depends=('ruby' 'python-pam' 'fakeroot' 'autoconf' 'automake' 'bison' 'debugedit' 'flex' 'm4' 'patch' 'pkgconf' 'texinfo' 'binutils' 'file' 'findutils' 'gawk' 'gcc' 'gettext' 'grep' 'groff' 'gzip' 'libtool' 'make' 'patch' 'sed' 'which')
source=('syca' 'syca-helper.c' 'syca-pam-auth.py' 'syca.pam')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
conflicts=('sudo' 'base-devel')

build() {
    gcc syca-helper.c -o syca-helper
}

package() {
    install -Dm755 "$srcdir/syca" "$pkgdir/usr/bin/syca"
    install -Dm755 "$srcdir/syca" "$pkgdir/usr/bin/sudo"
    install -Dm755 "$srcdir/syca-pam-auth.py" "$pkgdir/usr/lib/syca-pam-auth.py"
    install -Dm4755 "$srcdir/syca-helper" "$pkgdir/usr/lib/syca-helper"
    install -Dm644 "$srcdir/syca.pam" "$pkgdir/etc/pam.d/syca"
}
