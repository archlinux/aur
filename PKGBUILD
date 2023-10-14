# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.13.0
pkgrel=1
pkgdesc="A language for building concurrent software with confidence "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=(llvm15 git base-devel)
makedepends=('rust>=1.68' make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('1d63a1ac50abf2578ce69b0207f336d688dc9f745dcbb05c4090469cf824570e')

build() {
    make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
