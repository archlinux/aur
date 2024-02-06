# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=ivm
pkgver=0.5.0
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
sha256sums=('befa62c13316dc5c14144c10f642ef6c21c86226f9ffd8b66a36b27cc54b64d9')

build() {
    cd "${pkgname}-${pkgver}"
    make build PREFIX='/usr'
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
