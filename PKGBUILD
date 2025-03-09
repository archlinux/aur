# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=kodi-standalone-service
pkgver=1.139
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
b2sums=('449fd4cea5fb3d3e50a7f8e46caf7cd92dccccbb37e152d3c2fd5b77df9d26d631a5681a5f873b2df29be03c2cb982dd66ba9e9df05f6fccca1f919f47523fbb')

package() {
  cd "$pkgname-$pkgver"
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
