# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=swayosd-git
pkgver=gd0d70720
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
url="https://github.com/ErikReider/SwayOSD"
license=('GPL')
arch=('i686' 'x86_64' 'aarch64')
depends=('gtk3' 'gtk-layer-shell' 'pulseaudio')
makedepends=('rust' 'cargo')
source=('git+https://github.com/ErikReider/SwayOSD')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/SwayOSD"
  echo g$(git rev-parse HEAD | cut -c 1-8)
}

build() {
  cd "$srcdir/SwayOSD"
  cargo build --release
}

package() {
  install -Dm 755 "$srcdir/SwayOSD/target/release/swayosd" "$pkgdir/usr/bin/swayosd"
}
