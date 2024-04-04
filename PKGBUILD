# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=random2
pkgname=python-$_pyname
pkgver=1.0.2
pkgrel=2
pkgdesc='Python 3 compatible port of Python 2 random module'
arch=(any)
url='https://pypi.org/project/random2/'
license=(PSF)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://github.com/strichter/random2/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e63d92cfcbbe2f1dca064504e75f9e5e0f27f84867ec7fc7070cd71ca5d53fcd')

build() {
  cd $_pyname-$pkgver
  python -m build -wn
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
