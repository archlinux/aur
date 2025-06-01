# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.7.0
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
  '7860a556604f60ce0ca5bee9e60573bd2e61e0b4219a77e81e549f737616c02b'
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
