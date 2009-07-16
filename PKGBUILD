# $Id: PKGBUILD,v 1.9 2008/12/11 08:38:19 BaSh Exp $
# Maintainer: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-atk
pkgver=0.18.1
pkgrel=1
pkgdesc="Ruby bindings for ATK"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby' 'atk' 'ruby-glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('03589f80823371c0011f70f625abcf69')

build() {
  cd "$srcdir/ruby-gtk2-$pkgver"
  ruby extconf.rb atk
  make || return 1
  make DESTDIR="$pkgdir" install
}
