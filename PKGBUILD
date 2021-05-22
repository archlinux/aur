# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=3.1.10
pkgrel=1
pkgdesc='Easily manage wineprefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject')
optdepends=('wine')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}.tar.gz")
sha256sums=('b91c3dc95518b97ab26fd036194e39299eb0543474c04bf1769df21731cb688b')

build() {
  cd "Bottles-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
