# Maintainer: MatsyaOS <admin@matsyaos.ml>
pkgname=matsya-icons
pkgdesc="System default icon theme of Matsya OS"
pkgver=1.1
pkgrel=1
arch=('any')
url="https://github.com/matsyaos/icons"
license=('GPL')
groups=('Matsya')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=('git'+'https://github.com/matsyaos/icons')
md5sums=('SKIP')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}
