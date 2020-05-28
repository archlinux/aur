# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
_name=${pkgname#python-}
pkgver=0.10.3
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hvac/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('16dd05814aa8676797e46f71bfe36be770582984f19ed1f85dc5e030c633e626536df8c8855064affa9aafd9e296e1449831784b37da4b331b72a4e5668d76b8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
