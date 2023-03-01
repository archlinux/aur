# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-cos-python-sdk-v5
_pkgname=${pkgname/python-}
pkgver=1.9.23
pkgrel=1
pkgdesc="腾讯云COSV5Python SDK"
arch=('any')
url="https://github.com/tencentyun/cos-python-sdk-v5"
license=('MIT')
depends=('python-requests'
         'python-six'
         'python-dicttoxml'
         'python-crcmod'
         'python-pycryptodome')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tencentyun/cos-python-sdk-v5/archive/V${pkgver}.tar.gz")
sha256sums=('7603914bc08e8d0c47fa749c2784643150aed230c5b4260e6c63b7f0d8a293d7')

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
