# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=jaaa
pkgver=0.8.4
pkgrel=1
pkgdesc="JACK and ALSA Audio Analyser."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('clthreads' 'clxclient' 'fftw' 'jack' 'zita-alsa-pcmi')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('2eed043d641788541c15929183ef277f')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/"
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # doc
  install -Dm644 ../README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}

