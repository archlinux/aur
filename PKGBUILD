# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: damir <damir@archlinux.org>

pkgname=gtick
pkgver=0.5.5
pkgrel=1
pkgdesc="A Gtk metronome application supporting different meters and speeds"
arch=('i686' 'x86_64')
url="https://www.antcom.de/gtick"
license=('GPL3')
depends=('gtk2' 'libpulse')
makedepends=('libsndfile')
optdepends=('pulseaudio: pulseaudio sound system support')
source=("https://www.antcom.de/gtick/download/$pkgname-$pkgver.tar.gz")
sha1sums=('bfc95da9148e5f3105951331b26a6c8d87a34c5b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
