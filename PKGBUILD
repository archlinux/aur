# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=1.2.2
pkgrel=2
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf' 'python-setuptools')
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-pyqt5: for the GUI'
)
source=(https://files.pythonhosted.org/packages/source/f/flent/flent-${pkgver}.tar.gz{,.asc})
sha256sums=('4bbab5be36ae0d73ad47638be324a881643d229bfff713d74d29ff6cc6a42b7e'
            'SKIP')
validpgpkeys=('DE6162B5616BA9C9CAAC03074A55C497F744F705')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
