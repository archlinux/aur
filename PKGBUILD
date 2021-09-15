# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-envinfopy
pkgver=0.0.7
pkgrel=1
pkgdesc='Python Library to get execution environment information'
arch=('any')
url='https://github.com/thombashi/envinfopy'
license=('MIT')
depends=('python>=3.6')
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest>=6.0.1'
  'python-pytest-runner'
  'python-pytest-discord>=0.0.5'
  'python-pytest-md-report>=0.1'
  'python-subprocrunner>=1.2.1'
  'python-subprocrunner<2')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/envinfopy/envinfopy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/e/envinfopy/envinfopy-$pkgver.tar.gz.asc")
sha256sums=('83f1f3e9d735fbcbf8b76bcec1f972109aec8450df5688109b88a1952e66512e'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "envinfopy-$pkgver"
  python setup.py build
}

check() {
  cd "envinfopy-$pkgver"
  python setup.py pytest
}

package() {
  cd "envinfopy-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
