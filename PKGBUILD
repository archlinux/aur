# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-cos-python-sdk-v5
_pkgname=${pkgname/python-}
pkgver=1.9.38
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
sha256sums=('25cb73cc3e4b0dd4438724fc71cac074bae1fbb61f842b0422bf3910539eb0c9')

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
