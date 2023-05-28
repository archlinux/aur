# Maintainer: Paul Irofti <paul@irofti.net>
_name=spams
pkgname="python-$_name"
pkgver=2.6.5.4
pkgrel=1
pkgdesc="Python interface for SPArse Modeling Software (SPAMS)"

arch=('any')
url="http://spams-devel.gforge.inria.fr/"
license=('GPLv3')

depends=('python' 'cython' 'python-pillow' 'python-scipy' 'python-six')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4c15b01268b15d20dca1e29b04d08268775ad7aae5883891454de110b571c9a7')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
