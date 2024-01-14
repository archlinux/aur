# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-eventlib
pkgname=python-eventlib
pkgver=0.3.0
pkgrel=3
pkgdesc="Networking library for SIP SIMPLE Client SDK"
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-eventlib"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-greenlet' 'python-twisted')
conflicts=('python3-eventlib')
provides=('python3-eventlib')
replaces=('python3-eventlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('24e76faf733e3399a9895a1ec9ba1fe20e8d0c3fff3b7b304913493096bad463dded73b1f5c918394cbeac962ebbae2001fea4a621815225588b4da412ade7e9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
