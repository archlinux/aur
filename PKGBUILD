# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.7.2
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
  '6b605f7e4c46d894a64997e0f60eba937e7d68d908b4d715cd2dde3364bd79a2'
)

prepare() {
   cd horizon-$pkgver
}

build() {
  cd horizon-$pkgver
  arch-meson build

  meson compile -C build
}

package() {
    cd horizon-$pkgver
    meson install -C build --destdir "$pkgdir"
}
