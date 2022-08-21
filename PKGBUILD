# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_pkgname=${pkgname/python-}
pkgver=2.16.0
pkgrel=1
pkgdesc="The kms module of Aliyun Python sdk."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d5/6f/648401212f41c91f8aeb7676d57c2840ed258cca64854a9315c2280b15df/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a7f185772c88f3a0dda856b666dda436d82e00f9f11ea5bbf12dcab2610ee358')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
