# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-detect-secrets
_pkgname=detect_secrets
pkgver=1.2.0
pkgrel=2
pkgdesc="An enterprise friendly way of detecting and preventing secrets in code"
arch=("any")
url="https://github.com/Yelp/detect-secrets"
license=('Apache')
depends=('python-requests' 'python-yaml' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c160e897b3d0e81bf9cf0f6cc2e5e6434fa609a159f9a2849fcae0a08b4e2a30')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
