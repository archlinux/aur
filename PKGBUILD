# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=kodi-addon-graphlcd
pkgver=3.0.0
pkgrel=1
pkgdesc="Kodi service addon to interface with graphlcd"
url="https://github.com/M-Reimer/script.service.graphlcd"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python3' 'kodi' 'graphlcd-base>=2.0.0' 'ttf-dejavu')
source=("$pkgname-$pkgver.tar.gz::https://github.com/M-Reimer/script.service.graphlcd/archive/${pkgver}.tar.gz")
sha256sums=('e3953d12bf83452cb1caefea42ae57dfaa5732c31a78eaa5466827fb3e923b43')

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
