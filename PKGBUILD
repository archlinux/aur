# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=piscesde-icons-git
_pkgname=piscesde-icons
pkgver=0
pkgrel=2
pkgdesc="System default icon theme of piscesDE"
arch=('any')
url="https://github.com/piscesys/icons"
license=('GPL')
groups=('piscesde-icons-git')
depends=()
makedepends=('extra-cmake-modules' 'ninja' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd icons

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons
  DESTDIR="$pkgdir" ninja install
}
