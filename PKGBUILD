# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab
pkgver=2.1.0
pkgrel=1
pkgdesc="Core library for PSlab desktop"
arch=('any')
url="https://pslab.io"
license=('GPL3')
depends=(
  'python'
  'python-setuptools'
  'python-pyserial'
  'python-numpy'
  'python-scipy'
)
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/fossasia/$_pyname/archive/v$pkgver.tar.gz)
sha512sums=('47e5c955c212ad54fed948ca742cd4a134451fa234b4ecac61c210be6ce9f013e06390feae1e066988662caeb342387a3498df3ba0c7ec6eab667ffaaa7e92ef')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
