# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.3.3
pkgrel=1
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('git' 'jupyter-nbformat')
checkdepends=('python-pytest' 'python-pytest-flake8')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz"
"https://raw.githubusercontent.com/kynan/nbstripout/master/LICENSE.txt")
sha256sums=('d84659e2778ee2f90c16664e93ba0749ef414149cb607f5f36f2a91deba2ace4'
            '9842167c4bf9aa4662a669e8638d299a2460f6015ef0a98d4745871938bc1cd4')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
