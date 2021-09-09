# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sqlitebiter
pkgver=0.35.2
pkgrel=1
pkgdesc='Converts tabular formats into a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqlitebiter'
license=('MIT')
depends=(
  'python>=3.6'
  'jupyter-nbformat>=4.4.0'
  'jupyter-nbformat<6'
  'python-appconfigpy>=1.0.1'
  'python-appconfigpy<2'
  'python-click>=6.2'
  'python-click<9'
  'python-envinfopy>=0.0.7'
  'python-envinfopy<1'
  'python-loguru>=0.4.1'
  'python-loguru<1'
  'python-msgfy>=0.1.0'
  'python-msgfy<1'
  'python-path'
  'python-pathvalidate>=2.3.0'
  'python-pathvalidate<3'
  'python-pytablereader>=0.31.0'
  'python-pytablereader<2'
  'python-retryrequests>=0.0.2'
  'python-retryrequests<1'
  'python-simplesqlite>=1.2'
  'python-simplesqlite<2'
  'python-tcolorpy>=0.0.5'
  'python-tcolorpy<1'
  'python-typepy>=1.1.4'
  'python-typepy<2')
makedepends=('python-setuptools')
# checkdepends=(
#   'python-pytest>=6.0.1'
#   'python-pytest-runner'
#   'python-responses'
#   'python-sqliteschema>=1.1' ## AUR
#   'python-xlsxwriter')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('b2502f87ef35c8248731c87f9e008f5b249a93538f45bb33a14e7d1c05a6a14a'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

## FIXME: pytest pulls external dependencies
# check() {
#   cd "$pkgname-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
