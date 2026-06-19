# Maintainer: Nebulosa  <nebulosa2007 at yandex dot ru>

pkgname=cassette-bin
pkgver=0.2.4
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
  libxml2
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
_b=(https://git.altlinux.org 419245 200 1) # (buildurl buildtask buildid alt) for download links
source_aarch64=(${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/aarch64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.aarch64.rpm)
source_i686=(   ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/i586/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.i586.rpm)
source_x86_64=( ${_b[0]}/tasks/${_b[1]}/build/${_b[2]}/x86_64/rpms/${pkgname%-bin}-$pkgver-alt${_b[3]}.x86_64.rpm)
sha512sums_aarch64=('0c52aa3591dd17a49bc80f4ef3177448acb0d251d2317534494b7a01e7e7714af49d916481a06d7b2b1afccb2013709274b4daa3f534bdb3b83fd30ecbcafc22')
sha512sums_i686=('0dc4f5bf5b3afd0f1c39763d8cc5d83c96ff0f84812a3aeef2222d0be8e1169edc8d238aa05ddbc0863536504599d631517639178494035f22b8a40afb50849c')
sha512sums_x86_64=('e9fb09a65dd07a64986d4344cca7c8cf8ff09d8369ad609fa2974060831ed5624578da2c2c95e93c012cf4d51e850b94c392febd2133ce8e03a6c9ca50ac4e71')
b2sums_aarch64=('47dea7e4a1289b982ee5c457189f23d21cd45c3fae8a022958821cf4fd5ab1747ddc5889535910aec39faa500ce0f67dbbd9ed9270acd48601b210a09f6b80d9')
b2sums_i686=('ebd29d8ed5a51f563f1e904ad92c72854810893151fb507dda5db511ba7db2dd72fa9c97d2e6d8b31b9d3ad1d1b3bebd78695778a4a30c885fc6179501bc0a59')
b2sums_x86_64=('f4ff5c402244be8854e335871cc193a00f2d6bc92417f736945615135d736fdd523714e886d35470b4372d60daeefdfa39d8496dfc12e6f2cd6b2d23f550a9ac')

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
