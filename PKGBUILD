# Maintainer: RuDesktop <info@rudesktop.ru>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=rudesktop
pkgver=2.9.1069
pkgrel=5
arch=('x86_64')
pkgdesc="Ru-Desktop client for home use"
url="https://rudesktop.ru/downloads/"
license=('Commercial')
install=${pkgname}.install
depends=(sudo ca-certificates python lshw smartmontools pyalpm cron gtk3 libxcb alsa-lib libxfixes libsystemd python-evdev python-six python-pynput python-xlib libpulse)
sha256sums=('413dc48ae38076ce40ae1ac4f6f62e13e0f173bb656587041a093c10d17e8020')
options=(!debug)
source=("https://storage.rudesktop.ru/download/rudesktop-2.9.1069-x86_64.pkg.tar.zst")

package() {
  cd "${srcdir}"
  install -Dm 755 -d "${pkgdir}"/usr/share/rudesktop-client
  cp -r usr/share/rudesktop-client "${pkgdir}"/usr/share/
  cp -r usr/share/applications "${pkgdir}"/usr/share/
  cp -r usr/share/icons "${pkgdir}"/usr/share/
  install -Dm755 usr/bin/rudesktop "${pkgdir}/usr/bin/rudesktop"
  install -Dm664 usr/lib/libsciter-gtk.so "${pkgdir}/usr/lib/libsciter-gtk.so"
  install -Dm644 usr/share/${pkgname}-client/files/systemd/${pkgname}.service      "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 usr/share/${pkgname}-client/files/systemd/${pkgname}-user.service "${pkgdir}"/usr/lib/systemd/user/${pkgname}.service
}
