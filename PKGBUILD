# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=1.4.0
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('a0fbbbca903594975dd468af10581be8d52256ad441e7f8c71d1e70b341dbfe4')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
