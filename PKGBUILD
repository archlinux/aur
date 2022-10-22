# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-detect-secrets
_pkgname=detect_secrets
pkgver=1.4.0
pkgrel=1
pkgdesc="An enterprise friendly way of detecting and preventing secrets in code"
arch=("any")
url="https://github.com/Yelp/detect-secrets"
license=('Apache')
depends=('python-requests' 'python-yaml' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('63b2389e67c8faa48ab690bceda14655a9f0542d39c8dcd468bdb484e6e63ebab6404aefabf77867a3730bad7feae94cb1062e88ca4eab7f250f8398b4696c37')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
