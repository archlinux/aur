# Maintainer: saatvik333 <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=2.1.1
_tag=v2.1.1
_srcdir=wayland-bongocat-2.1.1
pkgrel=1
pkgdesc="Delightful Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('1a92eef42b4148fb636661e591015529fe73bf7a1a8c0ba03a92f1087086bec8')

build() {
  cd "$_srcdir"
  make release
}

package() {
  cd "$_srcdir"
  install -Dm755 build/release/bongocat "$pkgdir/usr/bin/bongocat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 bongocat.conf.example "$pkgdir/usr/share/doc/$pkgname/bongocat.conf.example"
  install -Dm644 man/bongocat.1 "$pkgdir/usr/share/man/man1/bongocat.1"
}
