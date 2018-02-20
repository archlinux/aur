# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Paul Wilk <paul.wilk@null.net>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libview
pkgver=0.6.6
pkgrel=4
pkgdesc="A collection of widgets that were developed at VMware"
arch=('x86_64')
url="http://view.sourceforge.net"
license=('MIT')
depends=('gtkmm' 'libsigc++')
source=(http://downloads.sf.net/sourceforge/view/libview-$pkgver.tar.gz)
md5sums=('f50f7cb04a4918e52a1707014dde47d2')

build() {
  cd "$srcdir"/libview-$pkgver
  CXXFLAGS+=' -std=c++11'
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir"/libview-$pkgver
  make DESTDIR="$pkgdir" install
  install -D COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
