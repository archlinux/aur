# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.8
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD-3-Clause')
depends=('mlite' 'qt5-declarative')
makedepends=('git')
source=("git+https://github.com/sailfishos/nemo-qml-plugin-configuration.git#tag=$pkgver")
sha512sums=('b8624ee2c730eee9a4493a42b9da37b9885739dff5dd45505315cea639d4daa2cea73a4a0e0f762d28bbbc38bb7cbff12c68dbe7ebe011d1e8ec5878682d1176')

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
