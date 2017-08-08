# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_pkgname=libstrangle
pkgname=${_pkgname}-git
pkgdesc="Simple FPS Limiter"
pkgver=r68.a5aa280
pkgrel=1
url='https://github.com/torkel104/libstrangle'
arch=('x86_64')
makedepends=('gcc-multilib')
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
source=("git+https://github.com/torkel104/libstrangle.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname

    sed -i -e '/ldconfig/d' makefile
}

package() {
    cd $_pkgname

    make prefix=/usr DESTDIR="$pkgdir" install
}
