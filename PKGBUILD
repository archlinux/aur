# Maintainer: aggraef@gmail.com
pkgname=osc2midi-utils
pkgver=0.1
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
source=("https://bitbucket.org/agraef/osc2midi-utils/downloads/osc2midi-utils-0.1.tar.gz")
md5sums=('3f82ccd572e1f053a1c89079bd27da3f')

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
