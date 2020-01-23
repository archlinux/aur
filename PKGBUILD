# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-epics
_pkgname=pyepics
pkgver=3.4.1
pkgrel=1
pkgdesc="Python interface to Epics Channel Access "
arch=('any')
url=http://pyepics.github.io/pyepics/
license=('custom')
depends=('python' 'python-numpy' 'epics-base')
makedepends=('python-setuptools')
source=("https://github.com/pyepics/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e3b852a98e483b6a6b53af94ab4aa1d3d51ac49434bfae32fcdacae31577e8d0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
