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
sha256sums=('0bded76a939662f9d5249e82ec14e68e6ab82e0dc35c087cc236046e34f9b5af')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
