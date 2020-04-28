# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-software-compiler_rt
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Python module containing data files for compiler_rt software (for use with LiteX)'
arch=('any')
url='https://github.com/litex-hub/pythondata-software-compiler_rt'
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('3e70d5e5941654588a353b866224b4e8b14324d4e771c2d43918ed4749e9c14d1e9229d6fa2f62fb7b58b2964f5d3f5d2f0fee6b14fd3862cfa211a3b93b89bb')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/data/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

