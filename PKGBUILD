# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=openbox-xdgmenu
pkgver=0.3
pkgrel=2
pkgdesc="fast xdg-menu converter to xml-pipe-menu"
url="https://launchpad.net/openbox-xdgmenu/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gnome-menus2')
install="info.install"
source=(http://launchpad.net/openbox-xdgmenu/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('824e099928aab2fb628f0fa4870ef7bba10b95581e47c2d8fa216709a0f399b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/{licenses/$pkgname/,man/man1/}}

  install -m755 "$srcdir"/$pkgname-$pkgver/openbox-xdgmenu \
    "$pkgdir"/usr/bin/
  install -m644 "$srcdir"/$pkgname-$pkgver/COPYING \
    "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 "$srcdir"/$pkgname-$pkgver/openbox-xdgmenu.1 \
    "$pkgdir"/usr/share/man/man1/
}

# vim:set ts=2 sw=2 et:
