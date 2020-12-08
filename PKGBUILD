# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bottles
pkgver=2.0.5
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('any')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('ad75317a88c83648cdf9d7583c94759b5b7887be97dc261397a7ff0e167a6b1a')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
