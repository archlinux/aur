# $Id: PKGBUILD 31087 2010-10-27 01:37:14Z bfanella $
# Maintainer: Brad Fanella <bradfanella@archlinux.us>

pkgname=ruby-gio2
pkgver=0.90.7
pkgrel=1
pkgdesc="Ruby bindings for gio2."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2')
makedepends=('ruby-pkgconfig')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('82ebea3ebb6fa51ffc5ec631b31d519a')

build() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	ruby extconf.rb gio2 --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
