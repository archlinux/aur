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
b2sums=('f48b758e06131bc5a773f34dcebe10da52952a1bad23de4996d9faee39e634a3ace1aa2617b24e71c8e6a58f25b6e281eade719d737c520f1eee2bc6c63ae27c')

package() {
  cd "$pkgname-$pkgver"
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
