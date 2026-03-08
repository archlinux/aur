# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.7
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD-3-Clause')
depends=('mlite' 'qt5-declarative')
makedepends=('git')
source=("git+https://github.com/sailfishos/nemo-qml-plugin-configuration.git#tag=$pkgver")
sha512sums=('b77c45d0438742182b4b690e5f820cdf0f838df382b864f9543132c1a2ebd18557b6ad40073e223f6681cce70e111a641681207f20b945542f791788652f93f3')

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
