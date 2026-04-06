# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.9
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD-3-Clause')
depends=('mlite' 'qt5-declarative')
makedepends=('git')
source=("git+https://github.com/sailfishos/nemo-qml-plugin-configuration.git#tag=$pkgver")
sha512sums=('962ab13d07cb449c1556444d543dd6e7539c2f426ba2f379b50403f56a49203820e04e275926b38c868ae2a5da8f1ed732ec7d118acdbb00f978ad1084ffb931')

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
