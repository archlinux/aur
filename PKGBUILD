# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Uberbacher <murks at lavabit dot com>

pkgname=jkmeter
pkgver=0.9.0
pkgrel=1
pkgdesc="A horizontal or vertical bargraph level meter based on the ideas of mastering guru Bob Katz."
arch=(x86_64)
url='http://kokkinizita.linuxaudio.org/linuxaudio/downloads/'
license=(GPL)
depends=(clthreads clxclient jack)
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('0062ca9a0d000b937364567ff41e3bf15798807c839d1a981e7fe6aedfdb7378')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
