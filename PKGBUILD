# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-epics
_pkgname=pyepics
pkgver=3.3.3
pkgrel=1
pkgdesc="Python interface to Epics Channel Access "
arch=('any')
url=http://pyepics.github.io/pyepics/
license=('custom')
depends=('python' 'python-numpy' 'epics-base')
makedepends=('python-setuptools')
source=("https://github.com/pyepics/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0ec2006a932246dd58b44f2ce122b70ca7c44f63ef2722aa59246cf2ea0f63e1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
