# Maintainer: graysky <graysky AT archlinux DOT us>

pkgbase=kodi-standalone-service
pkgname=(kodi-standalone-service kodi-standalone-gbm-service)
pkgver=1.96
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('GPL')
install=readme.install
source=("https://github.com/graysky2/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('9e6b36aa4e0bd3523dd9a88aa2f6aa3c8764e06eb7970fb8eeb407b73ec13790')

package_kodi-standalone-service() {
  depends=('kodi' 'polkit' 'xorg-server' 'xorg-xinit')
  install -Dm644 "$srcdir/$pkgbase-$pkgver/init/kodi.service" \
    "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -dm 700 "$pkgdir"/var/lib/kodi
  chown 420:420 "$pkgdir"/var/lib/kodi
}

package_kodi-standalone-gbm-service() {
  depends=('kodi-gbm' 'polkit' 'libinput')
  install -Dm644 "$srcdir/$pkgbase-$pkgver/init/kodi-gbm.service" \
    "$pkgdir/usr/lib/systemd/system/kodi-gbm.service"
  install -dm 700 "$pkgdir"/var/lib/kodi
  chown 420:420 "$pkgdir"/var/lib/kodi
}

# vim:set ts=2 sw=2 et:
