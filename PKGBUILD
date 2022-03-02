# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.6
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite' 'qt5-declarative')
source=("https://github.com/sailfishos/nemo-qml-plugin-configuration/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6d7ab135fe7e1686abbc073e945bb5f02aa867fda503b89bb0bbd2bcf9b062b9df6cedb4ba15d1fc2f0ef9dedac68b1f75f2473160754777e7f9ec0ea8bf1d0e')

build() {
  cd nemo-qml-plugin-configuration-$pkgver
  qmake-qt5
  make
}

package() {
  cd nemo-qml-plugin-configuration-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE.BSD -t "$pkgdir"/usr/share/licenses/$pkgname/
}
