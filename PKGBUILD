# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=2.0.0
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
    'python-qtpy: for the GUI'
    'python-pyqt5: for the GUI'
    'python-pyside2: for the GUI'
)
source=(https://files.pythonhosted.org/packages/source/f/flent/flent-${pkgver}.tar.gz{,.asc})
sha256sums=('8a9c33336f828b4e8621c59ae74e28c33b501a5ba074470041ff6aa897c15ce9'
            'SKIP')
validpgpkeys=('DE6162B5616BA9C9CAAC03074A55C497F744F705')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
