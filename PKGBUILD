# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-msrplib
pkgver=0.21.1
pkgrel=1
pkgdesc="MSRP (RFC4975) client library"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="http://download.ag-projects.com/SipSimpleSDK/Python3"
depends=(
  'python3-application'
  'python3-gnutls'
  'python3-eventlib'
  'python-twisted'
  'python-zope-interface'
  )
source=("http://download.ag-projects.com/SipSimpleSDK/Python3/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ad9dd88bd40ed4df843765d733ad38bb3ee52445100a47181bac851d7f753ec06cbbf4c61ba31991bbd98856f6157dc871d4b03c56a159669cddc2518060a5f6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
