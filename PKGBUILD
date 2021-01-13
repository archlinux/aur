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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pyepics/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a995685638c01a9326d3414de9b5471fb7b0bf6b1c60de1efae778c25dedaabf')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
