# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=kodi-standalone-service
pkgver=1.160
pkgrel=1
pkgdesc="Systemd services to run kodi in stand-alone mode without a DE"
# This is only for x86_64
# The kodi-rpi packages for ArchARM provide their own versions of this package
arch=(x86_64)
url="https://github.com/graysky2/kodi-standalone-service"
license=(MIT)
install=readme.install
depends=(polkit kodi)
replaces=(kodi-standalone-x11-service kodi-standalone-gbm-service kodi-standalone-wayland-service)
backup=(etc/conf.d/kodi-standalone)
optdepends=(
 'cage: for kodi-wayland.service'
 'wayland: for kodi-wayland.service'
 'xorg-server: for kodi-x11.service'
 'xorg-xinit: for kodi-x11.service'
) 
source=("$pkgname-v$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('f909cdb33caad995574717d7ce2318072fc643f234fc07f82fec48cfebdf517300c4c064d3679ed2dc57d0f9a82bf2769dbbd531700dca989925d3bc72145ffc')

package() {
  cd "$pkgname-$pkgver"
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
