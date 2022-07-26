# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-detect-secrets
_pkgname=detect_secrets
pkgver=1.3.0
pkgrel=1
pkgdesc="An enterprise friendly way of detecting and preventing secrets in code"
arch=("any")
url="https://github.com/Yelp/detect-secrets"
license=('Apache')
depends=('python-requests' 'python-yaml' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('14fa2f5dac9fac09c3afa91cf191a9f7f74399cbb265587ebdcee3aebd81ba1550a8163960172fb36b583957fb7617927646cf549425db0829c5cece2c6991b5')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
