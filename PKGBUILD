# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=spectra
pkgname=python-$_name
pkgver=0.1.0
pkgrel=2
pkgdesc="Easy color scales and color conversion for Python"
arch=('any')
url="https://github.com/jsvine/spectra"
license=('MIT')
depends=(python-colormath2)
makedepends=(python-build python-installer python-wheel)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('bf521a44ac14a0f9102c951e2cfbb87f878733a4b17579edc877ad719806cdea')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
