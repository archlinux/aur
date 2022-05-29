# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.3.1
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libarchive' 'libspnav')
makedepends=('boost-libs' 'boost' 'glm' 'python3')
source=("https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz")
sha256sums=('478632ce6c758884f16ae1f25c1f94358988051697124c4473f8e7d914e7320c')

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install install-man
}
