# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.10
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD-3-Clause')
depends=('mlite' 'qt5-declarative')
makedepends=('git')
source=("git+https://github.com/sailfishos/nemo-qml-plugin-configuration.git#tag=$pkgver")
sha512sums=('a485793282b8f50b284e347a02b0ffbab42210573bd1bb61b68d0146d7e7277447bd74b311835a2633d2e98a6f8ead823c7d8330eb5318837b2280840609fda3')

build() {
  cd nemo-qml-plugin-configuration
  qmake-qt5
  make
}

package() {
  cd nemo-qml-plugin-configuration
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE.BSD -t "$pkgdir"/usr/share/licenses/$pkgname/
}
