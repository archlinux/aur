# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.5.0
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo-0.9' 'libarchive' 'libspnav' 'cppzmq')
makedepends=('boost' 'glm' 'python3')
source=(
  "https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'c5cbe54b5f58289e52e4a8d0ed0594cd88ed0cfcef89e1c5ecdd5b82449449b4'
)

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install install-man
}
