# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeremy <reebydobalina@yahoo.ca>

pkgname=ruby-cairo
pkgver=1.14.1
pkgrel=2
pkgdesc='Ruby bindings for cairo'
arch=('x86_64' 'i686')
url='http://cairographics.org/rcairo/'
license=('GPL')
depends=('ruby' 'cairo')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('7ce10e7f6b0c432497723636d7ded399caf3b807b6b6f9d3ee9c2e34a2dabbee')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make -j1 DESTDIR="$pkgdir" install # Workaround installation failure with -j1
}

# vim:set ts=2 sw=2 et:
