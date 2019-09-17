# Maintainer: Fabio Loli
# Contributor: Jonas Malaco <jonas@protocubo.io>
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-rc
pkgver=1.2.0rc3
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices, RC release"
arch=(any)
url="https://github.com/jonasmalacofilho/liquidctl"
license=(GPL3)
depends=(python python-setuptools python-docopt python-pyusb python-hidapi python-appdirs)
makedepends=()
provides=(python-liquidctl)
conflicts=(python-liquidctl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jonasmalacofilho/liquidctl/archive/v${pkgver}.tar.gz")
sha256sums=('2f2e6bd5464ddc60cc84f6231e39ae8bddeef34e2ca9db913c79ead81ba6752e')

build() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
