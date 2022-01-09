# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.2.0
pkgrel=3
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libzip')
makedepends=('boost-libs' 'boost' 'glm' 'python3')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('6c04f2fe8a9e1ee148cd1aaf9d418eec2ebce1bdda1741c7a54fb53c95798f91')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install install-man
}
