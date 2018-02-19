# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgver_openzwafe=1.5
pkgname=gateway
pkgver=0.3.0
pkgrel=1
pkgdesc="Things Gateway by Mozilla"
arch=(any)
url="https://iot.mozilla.org/gateway/"
license=(MPL2)
depends=('libusb' 'nodejs' 'openzwave')
optdepends=()
makedepends=('git' 'yarn')
source=(git+http://github.com/mozilla-iot/gateway.git#tag=${pkgver}
  git+http://github.com/OpenZWave/open-zwave.git#tag=V${_pkgver_openzwafe})
sha1sums=('SKIP'
          'SKIP')

prepare() {
  mkdir -p bin
  ln -fs /usr/bin/node bin/nodejs
  export PATH=$PATH:`pwd`/bin
}

package() {
  cd "$srcdir/gateway"
  yarn
}
