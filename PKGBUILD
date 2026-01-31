# Maintainer: Ido Perlmuter <ido@ido50.net>
pkgname=waymux-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Tabbed Wayland Compositor"
arch=('x86_64')
url="https://github.com/ido50/waymux"
license=('MIT')
depends=(
   'wlroots0.19'
   'wayland'
   'libxkbcommon'
   'cairo'
   'tomlc17-git'
   'libinput'
   'libdrm'
   'mesa'
   'seatd'
   'xcb-util-wm'
   'libdisplay-info'
)
optdepends=(
   'xorg-xwayland: X11 application support'
)
source=("https://github.com/ido50/waymux/releases/download/v${pkgver}/waymux-${pkgver}-x86_64.tar.gz")
sha256sums=('974fd8b5e521b307cd949c74a5b2e1c4f1bf4510c122f12f3ed29a18a5bf8e1c')
provides=('waymux')
conflicts=('waymux')

package() {
  cp -r "$srcdir/usr" "$pkgdir/"

  # Install license if available
  if [ -f "$srcdir/usr/share/licenses/waymux/LICENSE" ]; then
      install -Dm644 "$srcdir/usr/share/licenses/waymux/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
