# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-gnutls
pkgver=3.1.8
pkgrel=1
pkgdesc="GnuTLS bindings for Python"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-gnutls"
depends=('python' 'python-twisted' 'gnutls')
source=("https://github.com/AGProjects/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f45e149a41a2b2d8441e17301db4ca29f42047aab5af781bb2e5a9a0b2db5c64deaff2c0a115b65104a3976dfbe39a8074dcfa1b53f7cab1a30645dc998bae70')

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
