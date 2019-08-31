#

pkgname=python-liquidctl-rc
pkgver=1.2.0rc1
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices, RC release"
arch=(any)
url="https://github.com/jonasmalacofilho/liquidctl"
license=(GPL3)
depends=(python libusb python-pyusb python-docopt)
makedepends=(python-setuptools)
provides=(python-liquidctl)
conflicts=(python-liquidctl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jonasmalacofilho/liquidctl/archive/v${pkgver}.tar.gz")
sha256sums=('143e48c924a6fdd632072bd07f001584b8516c7fb70dacbfc4788ba2b35c3bfe')

build() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
