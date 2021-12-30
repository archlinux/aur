# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=kodi-addon-graphlcd
pkgver=3.1.0
pkgrel=1
pkgdesc="Kodi service addon to interface with graphlcd"
url="https://github.com/M-Reimer/script.service.graphlcd"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python3' 'kodi' 'graphlcd-base>=2.0.0' 'ttf-dejavu')
source=("$pkgname-$pkgver.tar.gz::https://github.com/M-Reimer/script.service.graphlcd/archive/${pkgver}.tar.gz")
sha256sums=('7c9cd747dc4fb629658c11b87d02fd0e51c126fca45cd677dbf675639aa96362')

build() {
  cd "${srcdir}/script.service.graphlcd-$pkgver"
  make
}

package() {
  cd "${srcdir}/script.service.graphlcd-$pkgver"
  make DESTDIR=$pkgdir install

  # Make use of the graphlcd >= 2.0.0 system font directory search
  rm "$pkgdir/usr/share/kodi/addons/script.service.graphlcd/resources/fonts/"*.ttf
}
