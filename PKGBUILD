# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='colorpanes'
pkgver=3.0.0
pkgrel=3
pkgdesc='Panes in the 8 bright terminal colors with shadows of the respective darker color'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('678ac8506c9e09ac361b38947e5b46f64424082281166f8058f8b18ec8ec07bf')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cargo install --path . --root "$pkgdir/usr" --no-track
  ln -s "$pkgdir/usr/bin/colp" "$pkgdir/usr/bin/colorpanes"
}
