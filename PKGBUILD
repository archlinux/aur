# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aliyun-python-sdk-kms
_pkgname=${pkgname/python-}
pkgver=2.13.0
pkgrel=1
pkgdesc="The kms module of Aliyun Python sdk."
arch=('any')
url="https://github.com/aliyun/aliyun-openapi-python-sdk/"
license=('Apache')
depends=('python-aliyun-python-sdk-core')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
provides=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/95/83/a840e6c2a921964635663ed6eb02d8abeccc66adcb5b524088344e0a2ba6/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('759d3bb461278830f24462bc0566f8544b6c143b96d0b6d1966ee3e5b84cfa40')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
