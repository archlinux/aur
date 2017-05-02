# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur

pkgname=python2-palettable
_libname=${pkgname/python2-/}
pkgver=3.0.0
pkgrel=1
pkgdesc='Color palettes for Python'
arch=('any')
url='https://jiffyclub.github.io/palettable/'
license=('MIT')

depends=('python2' 'python2-matplotlib')

replaces=('python2-brewer2mpl')

source=("https://pypi.python.org/packages/31/6c/d95417ead6f8d9fc8ae0d6fbb76fb4107ced7ca949c96a3604bb2d23c401/palettable-3.0.0.tar.gz")
md5sums=('6e430319fe01386c81dbbc62534e3cc4')

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
