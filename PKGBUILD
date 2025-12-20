# Maintainer: Nebulosa  <nebulosa2007 at yandex dot ru>

pkgname=cassette-bin
pkgver=0.2.1.g49
pkgrel=1
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
_b=(https://git.altlinux.org 397860 200 1) # (buildurl buildtask buildid alt) for download links
source_aarch64=(${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/aarch64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.aarch64.rpm)
source_i686=(   ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/i586/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.i586.rpm)
source_x86_64=( ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/x86_64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.x86_64.rpm)
sha512sums_aarch64=('d8ae2ca33d59081136852ba2fb5d1e98fac10ad03f5d3969e3e7f86d918b9bdbc703ab363f4150f7d6e74925f803bacf783a2842bdfc97d1e38033ae3daab043')
sha512sums_i686=('607b67e3e313585aa812da45f905e0b093691ccd2a8cea83da28d0405ab1bfe207716a3b286177d8a917808bce79c02b3ed2cfa79261fe91e1d9b11d7d38a016')
sha512sums_x86_64=('f0ee4712aba3e7647f7e8273287280245cd532dacfb1bf485ef2c1725b1a7e236b542ab063e6b7537c43c21b86c16ad707237aeb7a5e3043c54793f6143052e5')
b2sums_aarch64=('4877d5d683a50ba1d0a3e8539d0613ebb2501c4e0b34d031b4b16a2aac41d5f952a664e421742a0ae5afed942e9b1db57e655e1819e28a487f0feea8e2901518')
b2sums_i686=('c0940503c265b57cd8beb09977dbe4aecce33d7c80a3d0fa43db4aa05ad037ce28a792778fcfe3f1628a9c40f43849b2fafb1a96407533d35a7fa1063f95ed64')
b2sums_x86_64=('0c4937515c13ca16a27fd4aef2654503415d842c43f6f9d48a61414fbfb7ea630debfcd502aee4153f350d8ea50513bd15c8aa677d437138918062b2f3ce4f1b')

package() {
  _prjname="space.rirusha.Cassette"
  install -vDm 755 usr/bin/${pkgname%-bin}                                      -t "$pkgdir"/usr/bin/
  install -vDm 644 usr/share/applications/$_prjname.desktop                     -t "$pkgdir"/usr/share/applications/
  install -vDm 644 usr/share/glib-2.0/schemas/$_prjname.gschema.xml             -t "$pkgdir"/usr/share/glib-2.0/schemas/
  install -vDm 644 usr/share/icons/hicolor/scalable/apps/$_prjname.svg          -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install -vDm 644 usr/share/icons/hicolor/symbolic/apps/$_prjname-symbolic.svg -t "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/
  for _lang in az be de es ka pt pt_BR ru sl sv tr zh_CN; do
    install -vDm 644 usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo     -t "$pkgdir"/usr/share/locale/$_lang/LC_MESSAGES/
  done
  install -vDm 644 usr/share/metainfo/$_prjname.metainfo.xml                    -t "$pkgdir"/usr/share/metainfo/
}
