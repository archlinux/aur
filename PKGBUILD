# Maintainer: aggraef@gmail.com
pkgname=osc2midi-utils
pkgver=0.2
pkgrel=1
pkgdesc="Utilities and GTK frontend for OSC2MIDI"
arch=('x86_64' 'i686')
url="https://bitbucket.org/agraef/osc2midi-utils/"
license=('BSD')
depends=('osc2midi' 'pure' 'pure-avahi' 'pure-ffi' 'pure-liblo' 'pure-sockets' 'pure-tk' 'pure-xml' 'gnocl' 'gnocl-builder' 'gnocl-gconf' 'desktop-file-utils')
optdepends=('touchosc-editor: create and edit TouchOSC layouts')
makedepends=()
provides=('osc2midi-utils')
conflicts=('osc2midi-utils-git')
install="osc2midi-utils.install"
source=("https://bitbucket.org/agraef/osc2midi-utils/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('f3dfd57b1455bd7725af09d2f27f9e38')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix=/usr DESTDIR="$pkgdir"
  # documentation and examples
  install -Dm644 README.md $pkgdir/usr/share/doc/osc2midi-utils/README.md
  install -dm755 $pkgdir/usr/share/doc/osc2midi-utils/examples
  install -Dm644 examples/* $pkgdir/usr/share/doc/osc2midi-utils/examples
}
