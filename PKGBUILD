# Maintainer: Nebulosa  <nebulosa2007 at yandex dot ru>

pkgname=cassette-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://gitlab.gnome.org/Rirusha/${pkgname%-bin}"
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gstreamer
  gtk4
  json-glib
  hicolor-icon-theme
  libadwaita
  libsoup3
  libgee
  libxml2-legacy #Temporary solution
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
_b=(https://git.altlinux.org 376117 200 1) # (buildurl buildtask buildid alt) for download links
source_aarch64=(${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/aarch64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.aarch64.rpm)
source_i686=(   ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/i586/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.i586.rpm)
source_x86_64=( ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/x86_64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.x86_64.rpm)
sha512sums_aarch64=('8e97a3342d288726b46c82e7747c15b6ec62cc6601ae0ed8e38379edd86b12007630f879fcf5cca739678237f46b5204c7783625e5d02a00f2acd1dd9a551d9d')
sha512sums_i686=('911a515232846a9e47c1d415edb86a04abf79fd2c1e0b3284570b71a96d0246d2074de414377ac14cf89e8c3811b731adf597185d73d5cff5977e63a3ebfdb16')
sha512sums_x86_64=('aa924d94d6be6459e950032cd3cbb8a076ba03aef1dee6cddae76881246091daefe9ba7c861ee87c75b44a0f17bcc33b3b82cc0ff8a9fcb741efbbe49ad9548e')
b2sums_aarch64=('17c217ec023e86c2422d4d38e51b8bc1e458425953cbb4e097aa80944541810d8fae5b3353323d728006ad8583e58fab15ded530ba0b6d220b6c787b5ee3ba38')
b2sums_i686=('94b04808c4c44b79d5db9fc7cd47f8dd5ec6ae86709dc670a0e81417c430278a5b33a98b10676e6aa78f862a668b7b4955a31feabb28105c4ad3766da7c679bf')
b2sums_x86_64=('c49cab890f9641626be708c213924033786afa3a799fe09abcd9d1b261f474959a15f385acdc5ba8e8c8b011fb0494ab0032f8b4d0ae98d22aa1adcfd81269e6')

package() {
  _prjname="space.rirusha.Cassette"
  install -vDm 755 usr/bin/${pkgname%-bin}                                      -t "$pkgdir"/usr/bin/
  install -vDm 644 usr/share/applications/$_prjname.desktop                     -t "$pkgdir"/usr/share/applications/
  install -vDm 644 usr/share/glib-2.0/schemas/$_prjname.gschema.xml             -t "$pkgdir"/usr/share/glib-2.0/schemas/
  install -vDm 644 usr/share/icons/hicolor/scalable/apps/$_prjname.svg          -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install -vDm 644 usr/share/icons/hicolor/symbolic/apps/$_prjname-symbolic.svg -t "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/
  for _lang in be de es pt pt_BR ru sl sv tr zh_CN; do
    install -vDm 644 usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo     -t "$pkgdir"/usr/share/locale/$_lang/LC_MESSAGES/
  done
  install -vDm 644 usr/share/metainfo/$_prjname.metainfo.xml                    -t "$pkgdir"/usr/share/metainfo/
}
