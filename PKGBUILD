# $Id: PKGBUILD 9174 2010-01-24 07:03:57Z ebelanger $
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ruby-libart
pkgver=0.90.5
pkgrel=1
pkgdesc='Ruby Libart2 bindings'
arch=('i686' 'x86_64')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
depends=('ruby' 'libart-lgpl' 'libpng' 'libjpeg')
makedepends=('ruby-pkgconfig')
source=("http://downloads.sourceforge.net/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz")
sha256sums=('4017da5fe9dc090c7ca26a0e02901bb66a7579475619f97bc1b7d7774d19945f')

build() {
  cd "$srcdir/ruby-gnome2-all-$pkgver"
  ruby extconf.rb libart
  make
}

package() {
  cd "$srcdir/ruby-gnome2-all-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
