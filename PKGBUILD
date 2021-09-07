# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-datetimerange
pkgver=1.2.0
pkgrel=1
pkgdesc='Python library for handling time ranges'
arch=('any')
url='https://github.com/thombashi/DateTimeRange'
license=('MIT')
depends=(
  'python3'
  'python>=3.6'
  'python-dateutil>=2.4.2'
  'python-dateutil<3'
  'python-typepy>=1.0.0' ## AUR
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=6.0.1' 'python-pytest-runner' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/D/DateTimeRange/DateTimeRange-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/D/DateTimeRange/DateTimeRange-$pkgver.tar.gz.asc")
sha256sums=('47bc10e5df23bb1f0d3ee493a26cb8d1d99e179884aabff62d3e51033b6a73ce'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "DateTimeRange-$pkgver"
  python setup.py build
}

## FIXME: test downloads external dependencies
# check() {
#   cd "DateTimeRange-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "DateTimeRange-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
