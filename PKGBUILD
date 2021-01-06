# Maintainer: Vassili Tchersky <vt+arch at vbc.su>

pkgname='imgkap'
pkgver=1.16.2
pkgrel=1
pkgdesc="Tool to manipuate raster nautical charts in BSB/KAP format"
arch=('x86_64')
url='https://github.com/nohal/imgkap'
license=('GPL3')
depends=('freeimage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nohal/imgkap/archive/v${pkgver}.tar.gz")
sha256sums=('c9b46f83828c6dd50dc13e2357bcb6e492cf13d7e6b21e830558f9ac35392718')

build() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  mkdir -p $pkgdir/usr/bin
  install -m 755 imgkap $pkgdir/usr/bin
}
