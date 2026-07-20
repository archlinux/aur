# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=dynamic-drpc-wayland-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland / Niri windows"
arch=('x86_64')
url="https://github.com/mrkirill046/discord-dynamic-status-wayland"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/discord-dynamic-status-wayland"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/discord-dynamic-status-wayland"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/discord-dynamic-status-wayland/target/release/discord-dynamic-status-wayland" "$pkgdir/usr/bin/discord-dynamic-status-wayland"
}

