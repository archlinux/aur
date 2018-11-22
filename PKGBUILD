# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=articlemetaapi
pkgname=('python-scielo-articlemeta')
pkgver=1.26.4
pkgrel=1
pkgdesc="SciELO's ArticleMeta API Client"
arch=('any')
url='https://github.com/scieloorg/articlemetaapi'
license=('BSD')
makedepends=('python-pip')
depends=('python-thriftpy' 'python-requests' 'python-scielo-xylose')
options=(!emptydirs)
sha256sums=('67855ba75c601b6bb45a8b9bc852b7f67bd9cd28aba5ad867a32cd20be1602a3'
            'ef8dfe393d6b68b332d3425d4a9301e0c24fd0c250f88a6a527fa800ccb7fd6e')
_pypi='https://files.pythonhosted.org/packages'
_path='7d/01/bceb7d0816ef21f77c413d30520ed7e8eb0a32654213e798f89723cef2d9'
_chash=8c6550a1ee5c92a71e4d27a9b71fffc12ef0b19d
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/scieloorg/articlemetaapi/$_chash/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
