# Maintiner: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
pkgname=ruby-cairo
pkgver=1.10.0
pkgrel=2
pkgdesc="Ruby bindings for cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/rcairo/"
license=('GPL')
depends=('ruby' 'cairo>=1.2.0')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('70e2df4fe0bcd2875d7512279058b116e964ca91d152cf9eb2f05b5c7774f118')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
