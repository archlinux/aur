# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-pango
pkgver=0.90.8
pkgrel=1
pkgdesc="Ruby bindings for pango."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2' 'ruby-cairo')
makedepends=('ruby-glib2' 'pango' 'ruby-pkgconfig' 'ruby-cairo')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('74966bde5366bc9d09701e9f464d60c9')
build() {
	cd "$srcdir/ruby-gtk2-$pkgver"

	ruby extconf.rb pango --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
