# Maintainer: Paul Irofti <paul@irofti.net>
_name=mat73
pkgname="python-$_name"
pkgver=0.65
pkgrel=1
pkgdesc="load MATLAB 7.3 .mat files into Python"
arch=('any')
url="https://github.com/skjerns/mat7.3"
license=('GPL3')
depends=('python' 'python-h5py' 'python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ad38a06af3d483632bd939ee572b3724ea8c03d37916765d7278f9de95541ade')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
