# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=cassette-bin
pkgver=0.1.4
pkgrel=1
_buildtask=339224
_buildid=300
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 armv8h i686 ppc64le x86_64)
url="https://github.com/rirusha/${pkgname%-bin}"
_buildurl="https://git.altlinux.org/tasks"
license=(GPL-3.0-only)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  libxml2
  sqlite
  webkitgtk-6.0
)
optdepends=(
  'gst-libav: nonfree media decoding'
  'gst-plugins-bad: media decoding'
  'gst-plugins-good: media decoding'
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source_aarch64=($_buildurl/$_buildtask/build/$_buildid/aarch64/rpms/${pkgname%-bin}-$pkgver-alt1.aarch64.rpm)
source_armv8h=( $_buildurl/$_buildtask/build/$_buildid/armh/rpms/${pkgname%-bin}-$pkgver-alt1.armh.rpm)
source_i686=(   $_buildurl/$_buildtask/build/$_buildid/i586/rpms/${pkgname%-bin}-$pkgver-alt1.i586.rpm)
source_ppc64le=($_buildurl/$_buildtask/build/$_buildid/ppc64le/rpms/${pkgname%-bin}-$pkgver-alt1.ppc64le.rpm)
source_x86_64=( $_buildurl/$_buildtask/build/$_buildid/x86_64/rpms/${pkgname%-bin}-$pkgver-alt1.x86_64.rpm)
md5sums_aarch64=('ef58668ca90b2d7b764a1494c93d9db0')
md5sums_armv8h=( 'ab8ab19ff9e888e4d7a0c7cb3dc237b6')
md5sums_i686=(   '101727f5a5f434f5c33fa87818ead64e')
md5sums_ppc64le=('15762baac2c853f9b3dc420668c811ad')
md5sums_x86_64=( '4cf70427842920ddeee380843b51d41b')

package() {
  _prjname="io.github.Rirusha.Cassette"
  install   -vDm755 usr/bin/${pkgname%-bin}                             -t "$pkgdir"/usr/bin/
  install   -vDm644 usr/share/applications/$_prjname.desktop            -t "$pkgdir"/usr/share/applications/
  install   -vDm644 usr/share/glib-2.0/schemas/$_prjname.gschema.xml    -t "$pkgdir"/usr/share/glib-2.0/schemas/
  install   -vDm644 usr/share/icons/hicolor/scalable/apps/$_prjname.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install   -vDm644 usr/share/icons/hicolor/symbolic/apps/*.svg         -t "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/
  for _lang in be es ru; do
    install -vDm644 usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo "$pkgdir"/usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo
  done
}
