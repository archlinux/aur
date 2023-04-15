# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=simple-droidcam-client
pkgver=0.8.0
pkgrel=2
pkgdesc='A simple droidcam client'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/tarmaciltur/simple-droidcam-client'
depends=('V4L2LOOPBACK-MODULE' 'ffmpeg' 'android-udev' 'gtk4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/tarmaciltur/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a92c592272c3fad312e4fe759d04d8b6ed1306047832175a5b951d739034ba07')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build --wrap-mode=nofallback

  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
