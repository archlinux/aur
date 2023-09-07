# Maintainer: effeffe <filippo dot falezza at outlook dot it>

pkgname=ysoft-client
major=4.0
minor=87
pkgver=${major}.${minor}
arch=('x86_64')
pkgrel=4
pkgdesc='YSOFT SafeQ Printing Software'
url='https://www.ysoft.com/'
depends=(
  'qt5-base'
  'qt5-webkit'
  'libcups'
)
optional_depends=(
  'libcrafter-git'
)
source=(
  "local://${pkgname}_${major}-${minor}_all.deb"
  "libpcre.so.3.13.2"
  "sqport"
  "KOC759UX.ppd"
  "kmC3100PX.ppd"
  "safeq-client.ini"
)
#Please move the local source files in the appropriate build directory
sha256sums=(
  '3d72e1606fd1d1bad493e7a35d6406181c24f72d31f5774b35f096418faa3e0d'
  '47e4aa7dbcc325bf87b9117d3e4d216a874ee547920068538f79d6a9aa2f8197'
  'afa82bdbdbe01bb85ca6088425521e32605daf7c585126ebb8b5d074cb965592'
  '420e009115695535d6625f710905bcdde8392731661693e382d19aaa04e69169'
  'f894547ae698583f962f0df8595001535483680d2215ec0181b97eed481d3d7f'
  '35d443eae73d12f926bc9f383f1f642efe0de1d5398efbc923fbabb141326660'
)
install="ysoft-client.install"
backup=(etc/ysoft/safeq-client.ini)

package() {
  cd "${srcdir}"
  tar -zxvf data.tar.gz
  install -D -m755 usr/sbin/ysoft-client-settings ${pkgdir}/usr/bin/ysoft-client-settings
  install -D -m755 usr/sbin/safeq-client-dhcp-sync ${pkgdir}/usr/bin/safeq-client-dhcp-sync
  install -D -m755 usr/bin/ysoft-client-kde ${pkgdir}/usr/bin/ysoft-client-kde
  install -D -m755 usr/bin/ysoft-client-gnome ${pkgdir}/usr/bin/ysoft-client-gnome
  install -D -m755 sqport ${pkgdir}/usr/lib/cups/backend/sqport
  install -D -m755 usr/lib/cups/backend/sqport ${pkgdir}/usr/lib/cups/backend/sqport.1
  install -D -m755 libpcre.so.3.13.2 ${pkgdir}/usr/lib/libpcre.so.3.13.2
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
  install -D -m 644 KOC759UX.ppd ${pkgdir}/usr/share/cups/model/KOC759UX.ppd
  install -D -m 644 kmC3100PX.ppd ${pkgdir}/usr/share/cups/model/kmC3100PX.ppd
  install -D -m 644 safeq-client.ini ${pkgdir}/etc/ysoft/safeq-client.ini

  }
