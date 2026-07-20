# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.21.0
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
sha256sums=('0038d9c2aaca739d7786fc4fe9690e3e476e65af6517758a699bc19fb8ce46d1')
options=(!lto)

build() {
    RUSTFLAGS="$RUSTFLAGS -C force-unwind-tables" make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
