# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=0.5.0
pkgrel=2
pkgdesc="A modular patch bay for audio and MIDI systems"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/patchage"
license=('GPL')
depends=('dbus-glib' 'libglademm' 'hicolor-icon-theme'
         'raul' 'flowcanvas<1.0.0' 'jack')
makedepends=('boost' 'python2')
install=$pkgname.install
source=(http://download.drobilla.net/$pkgname-$pkgver.tar.bz2)
md5sums=('3f1c297c8c6b998563d1a2fbc215cf85')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf --destdir="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
