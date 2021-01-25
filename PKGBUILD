# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>
pkgname=python-asyncio-dgram
_name=asyncio-dgram
pkgver=1.2.0
pkgrel=1
pkgdesc="Higher level Datagram support for Asyncio"
arch=('any')
url="https://github.com/jsbronder/asyncio-dgram"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/jsbronder/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('f252b0976ec7100f7716fddc1804dd8a7732cb404d6ef95354a34096548acfae')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
