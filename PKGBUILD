# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.0.0
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('b53b9bf6e50848022c0d9533d50dc6d2d36f29d39b4d083ba08dd48ca21decb3')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install install-man
}
