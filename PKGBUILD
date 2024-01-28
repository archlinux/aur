# Maintainer: Paul Irofti <paul@irofti.net>
_name=kymatio
pkgname="python-$_name"
pkgver=0.3.0
pkgrel=1
pkgdesc="Wavelet scattering in Python"

arch=('any')
url="https://www.kymat.io/"
license=('GPLv3')

depends=('python' 'python-numpy' 'python-scipy' 'python-appdirs'
  'python-configparser' 'python-packaging')
makedepends=('python-setuptools')

source=("git+https://github.com/${_name}/${_name}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
