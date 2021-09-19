# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-tabledata
pkgver=1.3.0
pkgrel=1
pkgdesc='Python library to represent tabular data'
arch=('any')
url='https://github.com/thombashi/tabledata'
license=('MIT')
depends=(
  'python>=3.6'
  ## ALL AUR
  'python-dataproperty>=0.53.0'
  'python-dataproperty<1'
  'python-typepy>=1.2.0'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=('python-pytablewriter>=0.46' 'python-pytest-runner' 'python-dateutil' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tabledata/tabledata-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/tabledata/tabledata-$pkgver.tar.gz.asc")
sha256sums=('54541b0c9e58f8fa38251ea0a60965dbaf95737027fa80e6ab56f98d7e4d61e9'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "tabledata-$pkgver"
  python setup.py build
}

check() {
  cd "tabledata-$pkgver"
  python setup.py pytest
}

package() {
  cd "tabledata-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
