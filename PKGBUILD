# Maintainer: fenze <fenze@contact.dev>

pkgname=rose-browser
pkgver=2.0
pkgrel=1
pkgdesc='Minimalist browser based on webkit2 and GTK4.'
arch=('x86_64')
url='https://github.com/mini-rose/rose'
license=('CUSTOM')
depends=('webkit2gtk-5.0')
source=("https://github.com/mini-rose/rose/releases/download/release/rose.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/rose-beta"
  make
}

package() {
  cd "$srcdir/rose-beta"
  install -Dm755 rose -t "$pkgdir/usr/bin/"
  install -Dm755 scripts/dmenu_rose.sh "$pkgdir/usr/bin/dmenu_rose"
}
