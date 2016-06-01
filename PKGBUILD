# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=ipdbplugin
pkgname=python-$_pyname
pkgver=1.4.5
pkgrel=1
pkgdesc='Nose plugin to use iPdb instead of Pdb when tests fail'
url='https://pypi.python.org/pypi/ipdbplugin'
depends=('python-ipdb' 'python-nose')
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('c9fe859cdb3b04809e331de2497d3a1d')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
}
