# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_name=${pkgname#python-}
_pkgname=${pkgname/python-}
pkgver=2.16.4
pkgrel=1
pkgdesc="The kms module of Aliyun Python sdk."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('0d5bb165c07b6a972939753a128507393f48011792ee0ec4f59b6021eabd9752')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
