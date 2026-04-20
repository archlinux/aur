# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.20.0
pkgrel=1
pkgdesc="A language for building concurrent software with confidence "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64 aarch64)
depends=(llvm git base-devel)
makedepends=(cargo make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('14356c5fd0a024a0ea5efb62c68bc404cd97325cfa78f0daee5d7f61bbcf407a')
options=(!lto)

build() {
    RUSTFLAGS="$RUSTFLAGS -C force-unwind-tables" make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
