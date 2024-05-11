# Maintainer: Paul Irofti <paul@irofti.net>
_name=mat73
pkgname="python-$_name"
pkgver=0.63
pkgrel=1
pkgdesc="load MATLAB 7.3 .mat files into Python"
arch=('any')
url="https://github.com/skjerns/mat7.3"
license=('GPL3')
depends=('python' 'python-h5py' 'python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c7e901e302d8172e6f1871819fb3f5f3d4a723c08c5aebde5d8d7b45e687d20b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
