# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.2.6
pkgrel=1
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('git' 'jupyter-notebook')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('09e86f12b7a211d4a4040ed939d905a7')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py test
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
