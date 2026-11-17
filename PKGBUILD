# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-cos-python-sdk-v5
_pkgname=${pkgname/python-}
pkgver=1.9.45
pkgrel=1
pkgdesc="腾讯云COSV5Python SDK"
arch=('any')
_pkgname=${pkgname%-bin}
url="https://github.com/tencentyun/cos-python-sdk-v5"
license=('MIT')
depends=('python-requests'
         'python-six'
         'python-xmltodict'
         'python-crcmod'
         'python-pycryptodome')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tencentyun/cos-python-sdk-v5/archive/V${pkgver}.tar.gz")
sha256sums=('da52494a5d97e17e3a9e909e57b950bb5e23e1dde872dee2e341c73dff4a5162')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
