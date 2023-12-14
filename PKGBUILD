# Maintainer: Yorick Peterse <aur@yorickpeterse.com>
pkgname=git-clogs
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate a changelog from Git commits containing trailers"
url="https://github.com/yorickpeterse/clogs"
license=(MPL2)
arch=(x86_64)
depends=(git)
makedepends=(inko)
provides=(clogs)
conflicts=()
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/yorickpeterse/clogs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5565939fe76930ff88dbcb205faffe8b1164f327d988a25aacd203c36209ceb7')

build() {
    cd "clogs-${pkgver}"
    inko pkg sync
    inko build -o ./build/clogs
}

package() {
    cd "clogs-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" ./build/clogs
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
