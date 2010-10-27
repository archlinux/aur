# $Id: PKGBUILD 31087 2010-10-27 01:37:14Z bfanella $
# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-gio2
pkgver=0.90.4
pkgrel=1
pkgdesc="Ruby bindings for gio2."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('f6565e87a63f16b86ecb98cddddd75a8')

build() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	ruby extconf.rb gio2 --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
