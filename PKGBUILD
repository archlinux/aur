# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

pkgname=python-pytablewriter
pkgver=0.62.0
pkgrel=1
pkgdesc='Python library to write a table in various formats'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
license=('MIT')
depends=(
  'python>=3.6'
  'python-dataproperty>=0.52.0'
  'python-dataproperty<2'
  'python-mbstrdecoder>=1.0.0'
  'python-mbstrdecoder<2'
  'python-pathvalidate>=2.3.0'
  'python-pathvalidate<3'
  'python-tabledata>=1.1.3'
  'python-tabledata<2'
  'python-tcolorpy>=0.0.5'
  'python-tcolorpy<1'
  'python-typepy>=1.2.0'
  'python-typepy<2')
makedepends=('python-setuptools')
# checkdepends=(
#   'python-idna'
#   'python-pytablereader>=0.29'
#   'python-pytest>=6.0.1'
#   'python-pytest-runner'
#   'python-sqliteschema'
#   'python-tablib')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pytablewriter/pytablewriter-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pytablewriter/pytablewriter-$pkgver.tar.gz.asc")
sha256sums=('19b2c48c8edde5c40e73cb91920eac8a9f8cd64dab155f4884ca394c35a59707'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "pytablewriter-$pkgver"
  python setup.py build
}

# check() {
#   cd "pytablewriter-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "pytablewriter-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
