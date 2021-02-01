# Maintainer:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2.1.0.5
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('any')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('ddb0f59d6d16b196e57e20f4959e76fba77e09658e1f80cb1545309d97c638e3')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
