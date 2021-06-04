# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=6.0.0
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools)
checkdepends=(python-mock python-pytest python-pytest-asyncio)
source=("https://github.com/Dinnerbone/mcstatus/archive/v${pkgver}.tar.gz")
sha256sums=('0d3be25638bda74fa57f29b8d912751edf528e5096e006ff8cc46ef3dac3f72f')

build() {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py build
}

check() {
  cd "${srcdir}/mcstatus-${pkgver}"

  # TODO: uncheck once dnspython 2 is supported
  #python -m pytest
}

package() {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
