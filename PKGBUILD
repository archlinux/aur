# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nitime
pkgname=python-$_pyname
pkgver=0.6
pkgrel=1
pkgdesc='timeseries analysis for neuroscience data'
url='http://nipy.org/nitime'
depends=('python-matplotlib' 'python-scipy')
optdepends=('python-networkx' 'python-nibabel')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('43d92863b8792a50336b40635999f909')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
