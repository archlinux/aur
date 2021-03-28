# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=3.1.2
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('wine' 'hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('3aacc125ec55a3a6cbf334404754f96b635b995b8877fe6763577fa9e6dbdfff')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
