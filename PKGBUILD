# Maintainer: effeffe <filippo dot falezza at outlook dot it>

pkgname=ysoft-client
major=4.0
minor=87
pkgver=${major}.${minor}
arch=('x86_64')
pkgrel=1
pkgdesc='YSOFT SafeQ Printing Software'
url='https://www.ysoft.com/'
license=('')
depends=(
  'qt5-base'
  'qt5-webkit'
  'libcups'
)
optional_depends=(
  'libcrafter-git'
)
source=("local://${pkgname}_${major}-${minor}_all.deb")
#Please move the source files in the appropriate build directory
sha256sums=('3d72e1606fd1d1bad493e7a35d6406181c24f72d31f5774b35f096418faa3e0d')
install="ysoft-client.install"

package() {
  cd "${srcdir}"
  tar -zxvf data.tar.gz
  install -D -m755 usr/sbin/ysoft-client-settings ${pkgdir}/usr/bin/ysoft-client-settings
  install -D -m755 usr/sbin/safeq-client-dhcp-sync ${pkgdir}/usr/bin/safeq-client-dhcp-sync
  install -D -m755 usr/bin/ysoft-client-kde ${pkgdir}/usr/bin/ysoft-client-kde
  install -D -m755 usr/bin/ysoft-client-gnome ${pkgdir}/usr/bin/ysoft-client-gnome
  install -D -m755 usr/lib/cups/backend/sqport ${pkgdir}/usr/lib/cups/backend/sqport
  install -D -m644 usr/share/icons/ysoft_icon.png ${pkgdir}/usr/share/icons/ysoft_icon.png
  install -D -m644 usr/share/applications/ysoft-client-settings-unity.desktop ${pkgdir}/usr/share/applications/ysoft-client-settings-unity.desktop
  install -D -m644 usr/share/applications/ysoft-client-settings-gnome.desktop ${pkgdir}/usr/share/applications/ysoft-client-settings-gnome.desktop
  install -D -m644 usr/share/applications/ysoft-client-kde.desktop ${pkgdir}/usr/share/applications/ysoft-client-kde.desktop
  install -D -m644 usr/share/applications/ysoft-client-gnome.desktop ${pkgdir}/usr/share/applications/ysoft-client-gnome.desktop
  install -D -m644 usr/share/doc/ysoft-client/copyright ${pkgdir}/usr/share/doc/ysoft-client/copyright
  install -D -m644 etc/xdg/autostart/ysoft-client-kde.desktop ${pkgdir}/etc/xdg/autostart/ysoft-client-kde.desktop
  install -D -m644 etc/xdg/autostart/ysoft-client-gnome.desktop ${pkgdir}/etc/xdg/autostart/ysoft-client-gnome.desktop
  install -D -m644 etc/ysoft/safeq-client.ini ${pkgdir}/etc/ysoft/safeq-client.ini
  install -D -m755 etc/network/if-up.d/safeq-client-dhcp-sync ${pkgdir}/etc/network/if-up.d/safeq-client-dhcp-sync

  }
