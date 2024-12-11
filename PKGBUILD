# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Maintainer: Fabien Loison <contact@flozz.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=4.14.0
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('948c5a13cd587e17cce3739b4268528b7ca0933106fa0707e460b5606d458a3486afb580e07fa92614cec08337656445096f606ceb45ecc409cb731c3ad8271a')
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
