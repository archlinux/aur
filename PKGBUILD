# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
_name=${pkgname#python-}
pkgver=0.10.4
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hvac/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('56cfa16c1b03eb3dbcd21abec667e8bee4f09aa4d20f390037cf48a664bcbb39721f9fc93a6e2a57fbbec4fc3cbe39f8c3a8dd73985884b32d10eea1ddb6dc20')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
