# Maintainer: mini-rose <fenze@contact.dev>
pkgname=rose-browser
pkgver=1.1.beta
pkgrel=1
pkgdesc='Minimalist browser based on webkit2 and GTK4.'
arch=('x86_64')
url='https://github.com/mini-rose/rose'
license=('CUSTOM')
depends=('webkit2gtk-5.0')
# options=('!strip')
source=("https://github.com/mini-rose/rose/releases/download/beta/rose.tar.gz")
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
