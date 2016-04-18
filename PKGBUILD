# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=xxhash
_pyver=0.5.0
pkgname=python-${_pyname,,}
pkgver=$_pyver
pkgrel=1
pkgdesc='Python binding for xxHash'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python')
makedepends=()
checkdepends=()
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('a12d5502c3a216c690f290f9d38eca4a')

build() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py test
}

package() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
