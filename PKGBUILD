# Maintainer: Larry Oates <leafman12345@gmail.com>
pkgname=doomfire-wallpaper
pkgver=1.0.0
pkgrel=8
pkgdesc="DOOM-style animated fire wallpaper for Hyprpaper"
arch=('x86_64')
url="https://github.com/Leafmun-certii/doom_fire_wallpaper"
license=('0BSD')
depends=('hyprpaper' 'grim')
makedepends=('git' 'cargo')
install=doomfire-wallpaper.install
source=("doom_fire_wallpaper::git+https://github.com/Leafmun-certii/doom_fire_wallpaper.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/doom_fire_wallpaper"
  cargo build --release --locked --bin doom-fire-wallpaper
}

package() {
  cd "$srcdir/doom_fire_wallpaper"
  install -Dm755 "target/release/doom-fire-wallpaper" "$pkgdir/usr/bin/doom-fire-wallpaper"
  install -Dm755 "dfpaper" "$pkgdir/usr/bin/dfpaper"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/doomfire-wallpaper/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
