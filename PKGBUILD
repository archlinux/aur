# Maintainer: zhangyu1818 <hey@zhangyu.dev>
pkgname=speedtest-ui-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="A modern and elegant speedtest tool built with Tauri and React, based on Speedtest® CLI. "
arch=('x86_64')
url="https://github.com/zhangyu1818/speedtest-ui"
license=('MIT')
makedepends=('binutils')
depends=(
  'webkit2gtk-4.1'
  'appmenu-gtk-module'
  'libappindicator-gtk3'
  'librsvg'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
)
provides=('speedtest-ui')
conflicts=('speedtest-ui')
source=("https://github.com/zhangyu1818/speedtest-ui/releases/download/app-v${pkgver}/Speedtest.UI_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  mkdir -p "$srcdir/extracted"
  cd "$srcdir"
  ar x "Speedtest.UI_${pkgver}_amd64.deb" --output "$srcdir/extracted"

  tar xf "$srcdir/extracted/data.tar."* -C "$pkgdir"

  mv "$pkgdir/usr/share/applications/Speedtest UI.desktop" \
    "$pkgdir/usr/share/applications/speedtest-ui.desktop"
}

