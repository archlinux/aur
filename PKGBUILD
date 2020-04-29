# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=1.1.0
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://github.com/horizon-eda/horizon"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('ab0e0bd19c811028435ac1633de6b300a09c06157aad61baae8e264bde0e8a6e')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
