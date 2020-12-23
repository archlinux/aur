# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bottles
pkgver=2.0.7
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('any')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('37cdc211ff3811f0bad0e624d817cfea36c00283be602ebfa64560178d0ed34b')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
