# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-atk
pkgver=0.19.0
pkgrel=2
pkgdesc="Ruby bindings for ATK"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby' 'atk' 'ruby-glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('a8f8dac03008d7c6397a3fe225ef5929')

build() {
  cd "$srcdir/ruby-gtk2-$pkgver"
  ruby extconf.rb atk || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
