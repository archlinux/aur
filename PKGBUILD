# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-standalone-service
pkgver=1.108
pkgrel=1
pkgdesc="Systemd services to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('MIT')
install=readme.install
depends=('polkit' 'libinput')
replaces=('kodi-standalone-x11-service' 'kodi-standalone-gbm-service' 'kodi-standalone-wayland-service')
optdepends=(
 'cage: for kodi-wayland.service'
 'xorg-server: for kodi-x11.service'
 'xorg-xinit: for kodi-x11.service'
) 
source=("$pkgname-v$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('e5f489dd0f2eb11ebea5fbf7dfc11d89344e8109db50385df82bbc78df7b4e44f240b40f005fa012873beb04e1999b203386679797738b3851ace008de523212')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 init/kodi-x11.service "$pkgdir/usr/lib/systemd/system/kodi-x11.service"
  install -Dm644 init/kodi-gbm.service "$pkgdir/usr/lib/systemd/system/kodi-gbm.service"
  install -Dm644 init/kodi-wayland.service "$pkgdir/usr/lib/systemd/system/kodi-wayland.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi-standalone.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi-standalone.conf"
}

# vim:set ts=2 sw=2 et:
