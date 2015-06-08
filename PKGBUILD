# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=naludump
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool to delete NALU fill data from h.264 streams"
url="http://www.udo-richter.de/vdr/naludump.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs')
makedepends=('libjpeg-turbo')
source=("http://www.udo-richter.de/vdr/files/$pkgname-$pkgver.tgz")
md5sums=('f7c82cac8e165f882215d30b3dde2fe0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 naludump "$pkgdir/usr/bin/naludump"
}
