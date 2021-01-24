# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-software-compiler_rt
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=1
pkgdesc='Python module containing data files for compiler_rt software (for use with LiteX)'
arch=('any')
url='https://github.com/litex-hub/pythondata-software-compiler_rt'
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7575f844785e122781e4834b9c1d168ca30ced1d9a8f612f300ea3b36c0faf3ab651e44ffd4a6f35e3fe79a21bcdcee257675ea02503a90f61c505434c31fad4')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/data/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
