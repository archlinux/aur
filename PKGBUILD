# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-detect-secrets
_pkgname=detect_secrets
pkgver=1.1.0
pkgrel=1
pkgdesc="An enterprise friendly way of detecting and preventing secrets in code"
arch=("any")
url="https://github.com/Yelp/detect-secrets"
license=('Apache')
depends=('python-requests' 'python-yaml' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('68250b31bc108f665f05f0ecfb34f92423280e48e65adbb887fdf721ed909627')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
