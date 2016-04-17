# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=Vapory
_pyver=0.1.01
pkgname=python-${_pyname,,}
pkgver=$_pyver
pkgrel=1
pkgdesc='3D rendering with Python and POV-Ray'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('povray' 'python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('be4a6cf30ffc9ce315e06ca5c7bdd34f')

build() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
