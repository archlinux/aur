# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=colorspacious
pkgname=python-$_pyname
pkgver=1.0.0
pkgrel=1
pkgdesc='A powerful, accurate, and easy-to-use Python library for doing colorspace conversions'
url='http://colorspacious.readthedocs.org/en/latest/'
depends=('python-numpy')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.zip"
        'LICENSE')
md5sums=('437218f372a0a832a70299cc6397feb1'
         '032f6276b1a63e4062c163daae656d61')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
