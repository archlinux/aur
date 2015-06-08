# Contributor: Owain Sutton < owainsutton at gmail dot com >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rumor
pkgver=1.0.5
pkgrel=1
pkgdesc="A realtime monophonic (with chords) MIDI keyboard to Lilypond converter."
arch=('i686' 'x86_64')
url="https://launchpad.net/rumor"
license=('GPL')
depends=('alsa-lib' 'guile1.8')
optdepends=('alsa-oss:  for OSS compatibility')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('b4b531829e6901c958dad805cf1ab8ae')
install=rumor.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

