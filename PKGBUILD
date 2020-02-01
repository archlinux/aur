# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=ohcount
pkgver=4.0.0
pkgrel=3
pkgdesc="source-lines of code counter"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://labs.ohloh.net/ohcount"
license=('GPL')
depends=('pcre' 'libmagic.so')
makedepends=('ragel>=6.3' 'swig' 'ruby' 'ruby-rake' 'gperf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/blackducksoftware/ohcount/archive/${pkgver}.tar.gz")
sha512sums=('ba2d8cd1a77e2b01419424785d061c5f5a8973ad49ca6bc1faf864d54e28b1ada5b2cddbc68932fa713a2682d30c8a98469737b3bffdbea1524e4ebe58edf584')

build() {
  cd "${pkgname}-${pkgver}"

  ./build ohcount
}

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  cp bin/ohcount "${pkgdir}/usr/bin/"
}
