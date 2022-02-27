# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-pytablereader
pkgver=0.31.3
pkgrel=1
pkgdesc='Load structured table data from various file formats'
arch=('any')
url='https://github.com/thombashi/pytablereader'
license=('MIT')
depends=(
  'python-beautifulsoup4'
  'python-dataproperty'
  'python-jsonschema'
  'python-mbstrdecoder'
  'python-path'
  'python-pathvalidate'
  'python-tabledata'
  'python-typepy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pytablereader/pytablereader-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pytablereader/pytablereader-$pkgver.tar.gz.asc")
sha256sums=('e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "pytablereader-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "pytablereader-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
