# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.18.0
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
sha256sums=('8ebd2c1d8cb3375b50c4236c39f331fd0942861ebeb30b317ec0f904843b5a26')
options=(!lto)

build() {
    make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
