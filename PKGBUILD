# Maintainer: Fabien Loison <contact@flozz.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=4.2.0
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ed3f35820834a5f740caaf121f056dea0f3e5070bb11d1e593b7601ee108a7ecafdc65553269d1377bdc734f78c7d2ee6a133317bc74129ba9adc9c986f1b235')
install=install
build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
