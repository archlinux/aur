# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=blurhash
pkgname=python-blurhash
pkgver=1.1.4
pkgrel=1
pkgdesc='Pure-Python implementation of the blurhash algorithm'
arch=('any')
url="https://github.com/halcy/blurhash-python"
license=('MIT')
depends=(python)
makedepends=(python-setuptools git)
checkdepends=(python-pillow
              python-numpy
              python-pytest-cov)
_commit=22e081ef1c24da1bb5c5eaa2c1d6649724deaef8
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd blurhash-python
  python setup.py build
}

check() {
  cd blurhash-python
  pytest
}

package() {
  cd blurhash-python
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
