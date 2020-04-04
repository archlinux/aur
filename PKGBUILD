# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=ret-sync-gdb-git
pkgver=r54.ba51775
pkgrel=1
pkgdesc="Set of plugins that help to synchronize a debugging session with a disassembler - GDB plugin"
arch=(any)
url="https://github.com/bootleg/ret-sync"
license=('GPL')
provides=('ret-sync-gdb')
conflicts=('ret-sync-gdb')

depends=('gdb')
makedepends=('git')
optdepends=('ret-sync-ghidra: Ghidra integration')

source=('git+https://github.com/bootleg/ret-sync')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/ret-sync"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/ret-sync/ext_gdb"
    install -D -m644 sync.py "$pkgdir/usr/share/retsync/sync.py"
}
