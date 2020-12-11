# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-cos-python-sdk-v5
_pkgname=${pkgname/python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="腾讯云COSV5Python SDK."
arch=('any')
url="https://github.com/tencentyun/cos-python-sdk-v5"
license=('MIT')
depends=('python-requests'
         'python-six'
         'python-dicttoxml'
         'python-crcmod'
         'python-pycryptodome')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
provides=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tencentyun/cos-python-sdk-v5/archive/v${pkgver}.tar.gz")
sha256sums=('ddbeea127241197ce034c6230b4ec796c1ed035d5155173ca9b909fb54fdaf18')

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
