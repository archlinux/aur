# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-otr
pkgver=2.0.1
pkgrel=1
pkgdesc="Off-The-Record Messaging (OTR) protocol implementation for python"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-otr"
depends=(
  'python-gmpy2'
  'python-zope-interface'
  'python3-application'
  )
source=("https://github.com/AGProjects/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3fc0a49b30e752f77be7533744a418a8471486a2860f50b7d9157f2bc25fe593cf4b486ae856cb3944695f61466a87e1ca34cdaf48eea7ef9ba2feaef78332c7')

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
