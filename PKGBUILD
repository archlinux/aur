# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_pkgname=${pkgname/python-}
pkgver=2.16.2
pkgrel=1
pkgdesc="The kms module of Aliyun Python sdk."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/cb/87/f0004243da50bb102715fdc92e2fbff92b039bfbd16400c57a7dba572308/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f87234a8b64d457ca2338f87650db18a3ce7f7dbc9bfef71efe8f2894aded3d6')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
