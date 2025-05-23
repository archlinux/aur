# Maintainer: Aron Kylebäck <aron@kyleback.com>
pkgname=smhibar-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Waybar weather module for Sweden using SMHI"
arch=('x86_64')
url="https://github.com/Collbrothers/SMHIbar"
license=('MIT')
depends=('waybar' 'ttf-weather-icons')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/smhibar" "$pkgdir/usr/bin/smhibar"
}