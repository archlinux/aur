# Maintainer: varsity <varsity@duck.com>
pkgname=hybrid-bar
pkgver=0.4.4
pkgrel=1
makedepends=('wget')
depends=('gtk3' 'gtk-layer-shell')
url="https://github.com/vars1ty/HybridBar"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A status bar focused on wlroots Wayland compositors - Latest Compiled Release"
license=('MIT')

prepare() {
    wget https://github.com/vars1ty/HybridBar/releases/download/0.4.4/hybrid-bar
}

package() {
  mkdir -p ~/.config/HybridBar/
  wget https://raw.githubusercontent.com/vars1ty/HybridBar/main/examples/config.json -P ~/.config/HybridBar/
  install -Dm0755 -t "$pkgdir/usr/bin/" "hybrid-bar"
}
