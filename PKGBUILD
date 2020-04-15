# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
_name=${pkgname#python-}
pkgver=0.10.1
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hvac/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('f11c0aeffdc90833f7fcfed7a178d5e1733299f61a0b4aae78d5f94d203529779e6227e07e2ddc9ca1436f918669079719633ef8c873f96fd98357fad52b79b0')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
