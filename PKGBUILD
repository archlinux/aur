# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=pyannotate
pkgver=1.2.0
pkgrel=8
pkgdesc='Auto-generate PEP-484 annotations'
arch=('any')
url='https://github.com/dropbox/pyannotate'
license=('Apache')
depends=('python-mypy_extensions' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cd755f3061f5c4320346f0198b71e4b312378a3810c5999f1d318b7427e7c55bd1bdfc4af84880bd45faf69eabccbd2684d1c18c1f9ad0661d35a377984ca063')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}


#check() {
#  cd $pkgname-$pkgver
#
#  python setup.py pytest
#}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
