# Maintainer: Brad Fanella <bradfanella@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-glib2
pkgver=0.19.4
pkgrel=2
pkgdesc="Ruby bindings for glib2."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('8b01f43de74f41561d8422b4ff1371c4')

build() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	ruby extconf.rb glib --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
