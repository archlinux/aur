# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=2.1.1
pkgrel=3
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
)
source=(https://files.pythonhosted.org/packages/source/f/flent/flent-${pkgver}.tar.gz)
sha256sums=('db581deac3d8099965dd0d8eee4b9c4d1857bdce5bc97790af9d3ed5b6554f73')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
