# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur

pkgname=python2-palettable
_libname=${pkgname/python2-/}
pkgver=2.1.1
pkgrel=1
pkgdesc='Color palettes for Python'
arch=('any')
url='https://jiffyclub.github.io/palettable/'
license=('MIT')

depends=('python2' 'python2-matplotlib')

replaces=('python2-brewer2mpl')

source=("https://pypi.python.org/packages/source/p/palettable/palettable-$pkgver.tar.gz")
md5sums=('60adcbda83e1eaa331c5fdc5dfbcc4ff')

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
