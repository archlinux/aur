# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hvac/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('7150536d1fe8e069b020973437aa19654310596ed20812bce7533aa85c0563064dc9222ed4ac7b464e96032b92eeccbc1468a9fa2df8cfab9e0507dd728ebc7c')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
