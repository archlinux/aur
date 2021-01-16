# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bottles
pkgver=2.1.0.1
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('any')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('d17edfcc7cc7bc1d53f417dabfe30892af7738cc155b6bb0f9517a3959529132')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
