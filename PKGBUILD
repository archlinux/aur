# Maintainer: giosuel <me@giosuel.ch>
pkgname=realer-xpad-bin
_pkgname=realer-xpad
pkgver=0.1.1
pkgrel=1
pkgdesc='Sticky notes with Markdown and drawing, native on Wayland and Hyprland (prebuilt binary)'
arch=('x86_64')
url='https://github.com/giosuel/realer-xpad'
license=('AGPL-3.0-only')
depends=('cairo' 'glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc' 'pango')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug') # the release binary is already stripped
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH-linux.tar.gz")
sha256sums_x86_64=('3c2fbad585a56d3e8a2a95f3be327e06b6647ca2d7381911da2c7c78ff9b8b39')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  install -Dm755 realer-xpad -t "$pkgdir/usr/bin"
  install -Dm644 extras/ch.giosuel.RealerXpad.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 extras/ch.giosuel.RealerXpad.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 data/icons/hicolor/scalable/apps/ch.giosuel.RealerXpad.svg \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md extras/hyprland.conf -t "$pkgdir/usr/share/doc/$_pkgname"
}
