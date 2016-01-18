# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=vmprof
pkgname=python-$_pyname
pkgver=0.2.3
pkgrel=1
pkgdesc="Python's vmprof client"
url='https://pypi.python.org/pypi/vmprof'
depends=('python-click' 'python-six' 'libdwarf' 'libelf' 'libunwind')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('f07959d94466dfe92fd65f63d4f906ef')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
