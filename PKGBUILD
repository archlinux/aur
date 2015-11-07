# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=vmprof
pkgname=python-$_pyname
pkgver=0.1.5.5
pkgrel=1
pkgdesc="Python's vmprof client"
url='https://pypi.python.org/pypi/vmprof'
depends=('python-click' 'python-six' 'libdwarf' 'libelf' 'libunwind')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz"
        'LICENSE')
md5sums=('c4a058ba74cebce39b9de3367a1fb089'
         'f4a0384fe9ff04541fbcb583b5dfd3c9')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
}
