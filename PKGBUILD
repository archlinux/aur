# Maintainer: 3m44n <notximan@proton.me>
pkgname=islet
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic Island / Floating Media HUD for wlroots and Smithay Wayland compositors"
arch=('x86_64')
url="https://github.com/3m44n/iSLET"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita' 'pipewire' 'wireplumber')
provides=('islet')
conflicts=('islet-git' 'islet-bin')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/islet-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('251fbbee8f79c6c95a08dd52e06075315c6f8dce329d346243d49085d15cf20e')

package() {
  cd "$srcdir"
  install -Dm755 "islet" "$pkgdir/usr/bin/islet"
  install -Dm755 "islet-ctl" "$pkgdir/usr/bin/islet-ctl"
  install -Dm644 "islet.service" "$pkgdir/usr/lib/systemd/user/islet.service"
  install -Dm644 "dev.islet.Overlay.desktop" "$pkgdir/usr/share/applications/dev.islet.Overlay.desktop"
  install -Dm644 "style.css" "$pkgdir/usr/share/islet/style.css"
  install -Dm644 "themes/theme-catppuccin-mocha.css" "$pkgdir/usr/share/islet/themes/catppuccin-mocha.css"
  install -Dm644 "themes/theme-dark-glass.css" "$pkgdir/usr/share/islet/themes/dark-glass.css"
}
