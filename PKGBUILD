# Maintainer: graysky <graysky AT archlinux DOT us>

pkgbase=kodi-standalone-service
pkgname=(kodi-standalone-service kodi-standalone-gbm-service)
pkgver=1.98
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('GPL')
install=readme.install
source=("https://github.com/graysky2/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('4d0009c741fc49cf364aa0028c84f6abf783ab780fbdcdf5b197e0aae4d9408b')

package_kodi-standalone-service() {
  depends=('kodi' 'polkit' 'xorg-server' 'xorg-xinit')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi.service "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi.conf"
}

package_kodi-standalone-gbm-service() {
  depends=('kodi-gbm' 'polkit' 'libinput')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi-gbm.service "$pkgdir/usr/lib/systemd/system/kodi-gbm.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi-gbm.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi-gbm.conf"
}

# vim:set ts=2 sw=2 et:
