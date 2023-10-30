# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.13.1
pkgrel=1
pkgdesc="A language for building concurrent software with confidence "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=(llvm15 git base-devel)
makedepends=(cargo make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('c674d58dd4b044dbfa40b13f444f4f3c0e632fc900ae906d56f39070ba62e846')

build() {
    make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
