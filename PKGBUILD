# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=gatspy
pkgname=python-$_pyname
pkgver=0.3
pkgrel=1
pkgdesc='General tools for Astronomical Time Series in Python'
url='http://www.astroml.org/gatspy/'
depends=('python-scipy')
optdepends=('python-astroml' 'python-supersmoother')
checkdepends=('python-astroml' 'python-nose')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('e75cc200229be28da805c80d554578e5')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-$pkgver
  nosetests gatspy
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
