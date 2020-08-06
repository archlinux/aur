# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=1.2.1
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://github.com/horizon-eda/horizon"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('3c0d66afeec55cf7fffbb25a467f7aac1576a5f93fec1f461d7f8a3e20072365')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
