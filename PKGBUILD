# Maintainer: Paul Irofti <paul@irofti.net>
_name=attrdict3
pkgname="python-$_name"
pkgver=2.0.2
pkgrel=1
pkgdesc="A dict with attribute-style access"
arch=('any')
url="https://github.com/pirofti/AttrDict3"
license=('BSD')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('004c171ca1120cc1755701db99d7fa4944afb1e68950434efdaa542513335fe8')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
