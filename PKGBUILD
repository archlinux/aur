# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=ivm
pkgver=0.4.1
pkgrel=1
pkgdesc="The cross-platform Inko version manager "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=(llvm15 git base-devel)
makedepends=(cargo make)
provides=(ivm)
conflicts=()
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/inko-lang/ivm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98d325646dd0e2a4425a32e8666edd82e9da0b7f1375401676c3946a2bf5ea10')

build() {
    cd "${pkgname}-${pkgver}"
    make build PREFIX='/usr'
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
