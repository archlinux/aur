# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeremy <reebydobalina@yahoo.ca>

pkgname=ruby-cairo
pkgver=1.12.8
pkgrel=1
pkgdesc='Ruby bindings for cairo'
arch=('x86_64' 'i686')
url='http://cairographics.org/rcairo/'
license=('GPL')
depends=('ruby' 'cairo')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('8a6a73c9c67eb0a5b6502483c8c39ffb6acbcadd2574123a6597271c2c25736d')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 ext/cairo/cairo.so \
    "$pkgdir/usr/lib/ruby/vendor_ruby/2.1.0/$CARCH-linux/cairo.so"
}

# vim:set ts=2 sw=2 et:
