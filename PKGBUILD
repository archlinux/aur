# Maintainer: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor:Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-glib2
pkgver=0.18.1
pkgrel=1
pkgdesc="Ruby Glib2 bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('GPL')
depends=('ruby' 'glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('03589f80823371c0011f70f625abcf69')

build() {
  cd "$srcdir/ruby-gtk2-$pkgver"
  ruby extconf.rb glib
  make || return 1
  make DESTDIR="$pkgdir" install
}
