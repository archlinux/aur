# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.19.1
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
sha256sums=('af39f9e9fd662523359a36011a74d24c727a8c44daaeb5b073ed4fb30ef69390')
options=(!lto)

build() {
    RUSTFLAGS="$RUSTFLAGS -C force-unwind-tables" make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
