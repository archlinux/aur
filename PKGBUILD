# Maintainer: Paul Irofti <paul@irofti.net>
_name=spams
pkgname="python-$_name"
pkgver=2.6.2.5
pkgrel=2
pkgdesc="Python interface for SPArse Modeling Software (SPAMS)"

arch=('any')
url="http://spams-devel.gforge.inria.fr/"
license=('GPLv3')

depends=('python' 'cython' 'python-pillow' 'python-scipy' 'python-six')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('25d5f226885a35f1690a8b2dea2eb3283835592965dd170baaecaf1593973a74')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
