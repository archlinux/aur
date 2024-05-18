# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_pkgname=${pkgname/python-}
pkgver=2.16.3
pkgrel=1
pkgdesc="The kms module of Aliyun Python sdk."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c5/a6/f958162647f2f581a5d767a5cf1b9e172183863559abfbe594face7141f7/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c31b7d24e153271a3043e801e7b6b6b3f0db47e95a83c8d10cdab8c11662fc39')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
