# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=0.15.0
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf' 'python-setuptools')
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-pyqt4: for the GUI'
)
source=(https://pypi.python.org/packages/source/f/flent/flent-${pkgver}.tar.gz{,.asc})
sha1sums=('14ce74928cc0024e6487397957e03cf7f7c8b40b'
          'SKIP')
validpgpkeys=('DE6162B5616BA9C9CAAC03074A55C497F744F705')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
