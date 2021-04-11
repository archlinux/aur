# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab
pkgver=2.3.2
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
sha512sums=('108b83bd73726f492a1295a189c689a51ec875d10cb6f3e585bef5d8d12fc68308d119463028836f072a60b28dfe374369fe814ff99f8599a58a1083b17384a1')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 pslab/99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
