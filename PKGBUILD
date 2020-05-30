# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=1.10
pkgrel=1
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD')
depends=('python' 'python-edalize' 'python-ipyxact' 'python-pyparsing' 'python-yaml' 'python-simplesat' 'git')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4954265e41918e3a4a8f5efb64285ffd8d8535e92843e3ee925dbca71bb9a56844d2f9cbe8573a7caa4b17ac2ae24d6f0ecc83b5ec026829e45828b61561e305')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
