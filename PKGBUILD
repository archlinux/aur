# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.13.0
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
depends=("ipython")
makedepends=('python-setuptools')
arch=("any")
license=("BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('a9359a2b5cecfc7762f86552194d6ed8464bdf410e3721794d4e9c5f2d313c40a2da16168c4a1eb28dcd566d260a2b0bb7a1d30791f1fe3ce8495a72f6ec2473')

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
