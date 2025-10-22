# Maintainer: RuDesktop <info@rudesktop.ru>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=rudesktop
pkgver=2.8.1705
pkgrel=2
arch=('x86_64')
pkgdesc="Ru-Desktop client for home use"
url="https://rudesktop.ru/downloads/"
license=('Commercial')
install=${pkgname}.install
depends=(sudo ca-certificates python lshw smartmontools pyalpm cron gtk3 libxcb alsa-lib libxfixes libsystemd python-evdev python-six python-pynput python-xlib libpulse)
sha256sums=('e625acb2fe3443d4cb241ee96c576a397f1dc490ad6554ccd035057ae1ac1d1f')
options=(!debug)
source=("https://storage.rudesktop.ru/download/rudesktop-2.8.1705-x86_64.pkg.tar.zst")

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
