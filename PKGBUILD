# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.6.0
pkgrel=1
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libarchive' 'libspnav' 'cppzmq')
makedepends=('meson' 'cmake' 'glm' 'python3')
source=(
  "https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'e7e680a05b92ac8ab4b6a32fb8e3b17bc298245d3d3d9224e9b3f7fb55b81256'
)

build() {
  cd horizon-$pkgver
  arch-meson build

  meson compile -C build
}

package() {
    cd horizon-$pkgver
    meson install -C build --destdir "$pkgdir"
}
