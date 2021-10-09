# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-eventlib
pkgver=0.3.0
pkgrel=1
pkgdesc="Networking library for SIP SIMPLE Client SDK"
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-eventlib"
depends=('python-greenlet' 'python-twisted')
source=("https://github.com/AGProjects/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('24e76faf733e3399a9895a1ec9ba1fe20e8d0c3fff3b7b304913493096bad463dded73b1f5c918394cbeac962ebbae2001fea4a621815225588b4da412ade7e9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
