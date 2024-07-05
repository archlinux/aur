# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-spectra
_name=${pkgname#python-}
pkgver=0.0.11
pkgrel=2
pkgdesc="Easy color scales and color conversion for Python"
arch=('any')
url="https://github.com/jsvine/spectra"
license=('MIT')
depends=(python-colormath)
makedepends=(python-build python-installer python-wheel)
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('bb7f38ce7a89363e02d0832e84200e87649008beec432815aa0fee8f037bb496')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
