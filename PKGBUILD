# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.13.2
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
depends=("ipython")
makedepends=('python-setuptools')
arch=("any")
license=("BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('46c0a0a1cb7d53af750e50ec462512fb1b80035105c67193841af89daf7fae6439c639602be08fb5c7a792d034f2a7ea40ba7367df17d8d6062f2383557f3075')

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
