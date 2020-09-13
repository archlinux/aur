# Maintainer:  Lukas K. <lu@0x83.eu>

_name=horizon
pkgname=${_name}-git
pkgver=r1811.cbf9df3a
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://github.com/horizon-eda/horizon"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm')
source=("git+https://github.com/horizon-eda/horizon.git")
md5sums=('SKIP')
conflicts=('horizon-eda')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_name"
    make
}

package() {
    cd "$srcdir/$_name"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
