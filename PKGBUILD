# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bottles
pkgver=2.0.1
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('any')
url="https://git.mirko.pm/brombinmirko/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://git.mirko.pm/brombinmirko/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('c98d3201f3ba4b0a6226ed44b0401fe893fed57cc433e1a7f6f2dcd33f92399d')

build() {
  cd bottles
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd bottles
  DESTDIR="${pkgdir}" ninja -C build install
}
