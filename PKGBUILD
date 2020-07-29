# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_pkgname=${pkgname/python-}
pkgver=2.11.0
pkgrel=1
pkgdesc="Alibaba Cloud SDK for Python."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
provides=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/e0/90/53403e07470ae560b0a69bf3c0ada9cc4c7a86c8bc0ac593b95839f5602a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6fad3918ae4a45c93e47bea897e9933dc154dc6224a708dcb686a6a9e82f93d2')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
