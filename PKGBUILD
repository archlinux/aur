# Maintainer: Brad Fanella <bradfanella@archlinux.us>

pkgname=ruby-cairo
_pkgname=rcairo
pkgver=1.10.0
pkgrel=2
pkgdesc="Ruby bindings for cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/rcairo/"
license=('GPL')
depends=('ruby' 'cairo>=1.2.0')
makedepends=('ruby-pkgconfig')
source=(http://cairographics.org/releases/$_pkgname-$pkgver.tar.gz)
md5sums=('4fe76f1069d0d1ccfdf7848e3e928d9f')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	ruby extconf.rb
	make
}
package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
