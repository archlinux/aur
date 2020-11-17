# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_name=ocspbuilder
pkgname=python-ocspbuilder
pkgver=0.10.2
pkgrel=1
pkgdesc="Python library for generating OCSP requests and responses"
url="https://github.com/wbond/ocspbuilder"
arch=(any)
license=(custom:MIT)
depends=(python python-asn1crypto python-oscrypto)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("945629537ac6d6960a7413fd32fc49448a442f9dfd87f6de5c239e89ed853a0d")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
