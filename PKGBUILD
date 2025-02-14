# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=ivm
pkgver=0.6.0
pkgrel=1
pkgdesc="The cross-platform Inko version manager "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=(llvm git base-devel)
makedepends=(cargo make)
provides=(ivm)
conflicts=()
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/inko-lang/ivm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e49bb6f3083d19aee922ae8a199d09a1405f052f1b28360b7ab21faaf764979')
options=(!lto)

build() {
    cd "${pkgname}-${pkgver}"
    make build PREFIX='/usr'
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
