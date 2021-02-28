# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-detect-secrets
_pkgname=detect_secrets
pkgver=1.0.3
pkgrel=1
pkgdesc="An enterprise friendly way of detecting and preventing secrets in code"
arch=("any")
url="https://github.com/Yelp/detect-secrets"
license=('Apache')
depends=('python-requests' 'python-yaml' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e2ea3f6b687a4d6ed4321f93ea7314ceceb383c643c85864ee38c0591ec42112')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
