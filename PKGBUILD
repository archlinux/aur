# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: pato <arch@totenstill.org>
# Contributor: Jens Maucher <defcon@archlinux.us>

pkgname=ruby-gnome2
pkgver=0.90.5
pkgrel=1
epoch=1
pkgdesc='Ruby Gnome bindings'
arch=('i686' 'x86_64')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
depends=('libgnomeui' 'ruby-gnomecanvas')
makedepends=('ruby-pkgconfig')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-all-$pkgver.tar.gz")
sha256sums=('4017da5fe9dc090c7ca26a0e02901bb66a7579475619f97bc1b7d7774d19945f')

build() {
  cd "$srcdir/$pkgname-all-$pkgver"
  ruby extconf.rb gnome
  make
}

package() {
  cd "$srcdir/$pkgname-all-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
