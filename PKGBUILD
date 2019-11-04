# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.12.2
pkgrel=2
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
depends=("ipython")
makedepends=('python-setuptools')
arch=("any")
license=("BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('b8ff11e0f133be4113cbc5b31762ecc63ddd4d3084394775b8433fdc138296e4840bd114b5aa249597e3fb9b055b9060e2599dda0a8a9a90e472e4e33b798398')

build() {
  cd ipdb-$pkgver
  python setup.py build
}

check() {
  cd ipdb-$pkgver
  python setup.py test
}

package() {
  cd ipdb-$pkgver
  python setup.py install -O1 --root="$pkgdir"
  ln -s ipdb3 "$pkgdir"/usr/bin/ipdb
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}
