# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_name=certbuilder
pkgname=python-certbuilder
pkgver=0.14.2
pkgrel=1
pkgdesc="Python library for generating and signing X.509 certificates"
url="https://github.com/wbond/certbuilder"
arch=(any)
license=(custom:MIT)
depends=(python python-asn1crypto python-oscrypto)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("56a8aee8ed31a211678647797dfdcdc85ec25d5d1bb1515e44ebae45cce363f9")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
