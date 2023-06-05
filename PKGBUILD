# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.12.0
pkgrel=1
pkgdesc="A language for building concurrent software with confidence "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('llvm>=15.0.0' 'llvm<=16.0.0' git base-devel)
makedepends=('rust>=1.63' make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('56584ece9d1522401d0855d3d103ee7e53fee74f12441a5e26b32f8d5eb934b8')

build() {
    make build PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
