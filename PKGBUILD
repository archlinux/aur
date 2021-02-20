# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab
pkgver=2.0.1
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
sha512sums=('e2f5e8de5fb286e0be97c0de888245fe3d2fec54dd2fce14d6bc4b42bb419d086bd22135c866c7a653b44c32526a4132abd068dd6ec91977f927dad8d35ddf08')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
