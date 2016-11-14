# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: damir <damir@archlinux.org>

pkgname=gtick
pkgver=0.5.4
pkgrel=3
pkgdesc="A Gtk metronome application supporting different meters and speeds"
arch=('i686' 'x86_64')
url="http://launchpad.net/gtick"
license=('GPL3')
depends=('gtk2' 'libpulse')
makedepends=('libsndfile')
optdepends=('pulseaudio: pulseaudio sound system support')
source=("http://launchpad.net/gtick/0.5/0.5.4/+download/$pkgname-$pkgver.tar.gz")
sha1sums=('4500d4d79904a422b2ad30aef7bb5787d7c8a396')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
