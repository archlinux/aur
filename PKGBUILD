# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-otr
pkgver=3.0.0
pkgrel=1
pkgdesc="Off-The-Record Messaging (OTR) protocol implementation for python"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="http://download.ag-projects.com/SipSimpleSDK/Python3"
depends=(
  'python-gmpy2'
  'python-zope-interface'
  'python3-application'
  )
source=("http://download.ag-projects.com/SipSimpleSDK/Python3/${pkgname}-${pkgver}.tar.gz")
sha512sums=('16cba9fb7d021e88b5e4e1b3eb3047829f3c998a7a8511ef8881f9013716fdd53e96c2e96d91022dbc83bf72b5f22a2fd5466cc91c859926cef32c2b06466d82')

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
