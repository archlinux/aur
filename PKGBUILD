# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab
pkgver=2.2.0
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
sha512sums=('d379c288cc65319675b2d36ef94e91b0186f88f80c4882af173a4df6f9c79343f437e00446f7c54cd49f8b7c66745d60d3969584269ff63d24fc7ea786b38dce')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
