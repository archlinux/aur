pkgname=qmarineplatformtheme6
_conflictpkgname=qt6ct
_pkguntar=qmarinetheme
pkgver=0.1.3
pkgrel=1
pkgdesc="Another qt6ct for qt6, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus')
depends=('qt5-base')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('c94b62df22dcadf9537ca9f8083ee3bca5333e251eb17a05ee9d1ae760672a22')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/qmarinetheme/archive/refs/tags/v${pkgver}.tar.gz")
build() {
  cd ${_pkguntar}-$pkgver
  cmake . -GNinja \
        -DAS_KDE6_PLUGIN=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd ${_pkguntar}-$pkgver
  DESTDIR="$pkgdir" ninja install
}
