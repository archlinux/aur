# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeremy <reebydobalina@yahoo.ca>

pkgname=ruby-cairo
pkgver=1.12.6
pkgrel=1
pkgdesc='Ruby bindings for cairo'
arch=('x86_64' 'i686')
url='http://cairographics.org/rcairo/'
license=('GPL')
depends=('ruby' 'cairo')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('e7ff8d49a730662b3f999187fde45ac0b8651996fe7f9a952496be8b6e45800e')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 ext/cairo/cairo.so \
    "$pkgdir/usr/lib/ruby/vendor_ruby/2.0.0/$CARCH-linux/cairo.so"
}

# vim:set ts=2 sw=2 et:
