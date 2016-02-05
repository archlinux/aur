# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=viscm
pkgname=python-$_pyname
pkgver=0.7
pkgrel=1
pkgdesc='A colormap tool'
url='https://pypi.python.org/pypi/viscm/'
depends=('python-matplotlib' 'python-colorspacious')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.zip"
        'LICENSE')
md5sums=('f544596bc521e85513c8377f1eb5198d'
         '5f55a94c837657a48d83f91fdc6529f7')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
