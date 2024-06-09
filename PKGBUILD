# Contributor: Miguel de Val-Borro <miguel . deval @ gmail . com>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>

_name=pyraf
pkgname=python-pyraf
pkgver=2.2.2
pkgrel=1
pkgdesc="Python interface for IRAF"
license=('BSD-1-Clause')
arch=('i686' 'x86_64')
depends=('iraf-bin' 'python-stsci.tools' 'python-matplotlib' 'python-numpy' 'python-urwid' 'tcl' 'tk')
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('ipython')
url="https://github.com/spacetelescope/pyraf"
source=(${_name}-${pkgver}.tar.gz::https://github.com/iraf-community/pyraf/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('218b2db197f425b9b6ecaf7f4d26f492')


build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
