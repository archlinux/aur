# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Uberbacher <murks at lavabit dot com>

pkgname=jkmeter  
pkgver=0.6.1
pkgrel=2
pkgdesc="A horizontal or vertical bargraph level meter based on the ideas of mastering guru Bob Katz."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
license=('GPL')
depends=('clthreads' 'clxclient' 'jack')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('649cda4465fe070505ae0a1d730b398f')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
