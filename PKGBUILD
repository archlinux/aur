pkgname=autolon-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='Autoclicker and automation controller for Legends of IdleOn - Wayland-only (KDE preferred)'
arch=('x86_64')
url='https://github.com/daveottley/autolon'
license=('MIT')
depends=('acl' 'gtk4' 'libxtst' 'qt6-tools')
provides=("autolon=$pkgver")
conflicts=('autolon')
install=autolon.install
source_x86_64=("autolon-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/autolon-$pkgver-x86_64.tar.zst")
sha256sums_x86_64=('b6d540e3f2384929d9d7819a23bc4b02e42dbcadb7f3569f62ac33ec801d3721')

package() {
  cd "$srcdir/autolon-$pkgver-x86_64"

  install -Dm755 usr/bin/autolon "$pkgdir/usr/bin/autolon"
  install -Dm644 usr/share/applications/io.github.autolon.Autolon.desktop \
    "$pkgdir/usr/share/applications/io.github.autolon.Autolon.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/io.github.autolon.Autolon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.autolon.Autolon.svg"
  install -Dm644 usr/share/metainfo/io.github.autolon.Autolon.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.autolon.Autolon.metainfo.xml"
  install -Dm644 usr/lib/systemd/user/autolon.service \
    "$pkgdir/usr/lib/systemd/user/autolon.service"
  install -Dm644 usr/lib/udev/rules.d/70-autolon-uinput.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-autolon-uinput.rules"
  install -Dm644 usr/lib/sysusers.d/autolon.conf \
    "$pkgdir/usr/lib/sysusers.d/autolon.conf"
  install -Dm644 usr/share/licenses/autolon/LICENSE \
    "$pkgdir/usr/share/licenses/autolon/LICENSE"
}
