# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
_name=${pkgname#python-}
pkgver=0.9.6
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hvac/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('0f4d9b03a2e102e15c25d689290251f66ab1de7aaa3cdee4285bf447453d223193840be48bec7cd898a69208376c28f82490b640f8ffc1a0e8707a6521966011')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
