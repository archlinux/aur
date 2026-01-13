# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=dynamic-drpc-hyprland-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/mrkirill046/discord-dynamic-status-hyprland"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/discord-dynamic-status-hyprland"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/discord-dynamic-status-hyprland"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/discord-dynamic-status-hyprland/target/release/discord-dynamic-status-hyprland" "$pkgdir/usr/bin/dynamic-drpc-hyprland"
}

