# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-atk
pkgver=0.90.1
pkgrel=1
pkgdesc="Ruby bindings for atk."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('8b0fa2bc166f85287a4c94e3b193472c')

build() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	ruby extconf.rb atk --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
