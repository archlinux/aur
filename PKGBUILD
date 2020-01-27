# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.3.7
pkgrel=1
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('jupyter-nbformat')
#checkdepends=('git' 'hg' 'python-pytest' 'python-pytest-cram')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz"
"https://raw.githubusercontent.com/kynan/nbstripout/master/LICENSE.txt")
sha256sums=('62f1b1fe9c7c298061089fd9bd5d297eb6209f7fbef0758631dbe58d38fc828f'
            'cceb6581e12b4e46f8291d138b15731e8b77e6e1eee9dca23be2297e2c48fe29')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

#check() {
  #cd $srcdir/$_pyname-$pkgver
  #python setup.py test
#}
