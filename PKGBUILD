# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-pytablereader
pkgver=0.31.0
pkgrel=1
pkgdesc='Load structured table data from various file formats'
arch=('any')
url='https://github.com/thombashi/pytablereader'
license=('MIT')
depends=(
  'python>=3.6'
  'python-beautifulsoup4>=4.4.1'
  'python-beautifulsoup4<5'
  'python-dataproperty>=0.50.1'
  'python-dataproperty<2'
  'python-jsonschema>=2.5.1'
  'python-jsonschema<4'
  'python-mbstrdecoder>=1.0.0'
  'python-mbstrdecoder<2'
  'python-path'
  'python-pathvalidate>=2.3.0'
  'python-pathvalidate<3'
  'python-tabledata>=1.1.1'
  'python-tabledata<2'
  'python-typepy>=1.1.4'
  'python-typepy<2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pytablereader/pytablereader-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pytablereader/pytablereader-$pkgver.tar.gz.asc")
sha256sums=('9977677c19883e29f7e2cd6c0eda588ce1fbde6d73632f64d670a531bc4a9cf7'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "pytablereader-$pkgver"
  python setup.py build
}

package() {
  cd "pytablereader-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
