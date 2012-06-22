# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>

pkgname=ruby-cairo
pkgver=1.12.2
pkgrel=1
pkgdesc="Ruby bindings for cairo"
arch=('x86_64' 'i686')
url="http://cairographics.org/rcairo/"
license=('GPL')
depends=('ruby' 'cairo>=1.2.0')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('f071d6ccb12cb6dc1fc91eb086d6150ce779930fe5af38a6987e378c809362c5')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
