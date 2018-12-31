# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-py-spin
pkgver=1.1.1
pkgrel=1
pkgdesc='Little terminal spinner lib'
arch=('any')
url=https://github.com/lord63/py-spin
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pyspin/pyspin-$pkgver.tar.gz")
sha512sums=('13bce96ae7fa725455729aac2d46b7c1c372242ab56190b7fe73da4402d0e0b3a372ceb5a0c562677b893c1ac6547ba7f64266bf6064abe0eec15126cf3d3a8b')

build() {
  cd pyspin-$pkgver
  python setup.py build
}

package() {
  cd pyspin-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
