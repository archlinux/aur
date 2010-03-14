# Maintainer: Ray Rashif <schivmeister@gmail.com>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=0.4.4
pkgrel=1
pkgdesc="A modular patch bay for audio and MIDI systems"
arch=(i686 x86_64)
url="http://drobilla.net/software/patchage"
license=('GPL')
depends=('dbus-glib' 'libglademm' 'hicolor-icon-theme'
         'raul' 'flowcanvas' 'jack')
makedepends=('boost' 'python')
install=$pkgname.install
source=(http://download.drobilla.net/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./waf configure --prefix=/usr
  ./waf build $MAKEFLAGS || return 1
  ./waf --destdir="$pkgdir" install
}
md5sums=('9482aef41622b1b4e77ed079b427a050')
