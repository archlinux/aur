# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: hm_b <holger@music-nerds.net>
# Contributor: Leslie P. Polzer <polzer@stardawn.org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jack_capture
pkgver=0.9.71
pkgrel=1
pkgdesc="Simple command line tool to record JACK audio output to a file"
arch=('i686' 'x86_64')
url="http://www.notam02.no/arkiv/src/"
license=('GPL')
depends=('jack' 'lame' 'liblo')
optdepends=('meterbridge: levels monitor'
            'zenity: gtk2 gui')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('9f5f39d2183c32a790612ca0257fdcc4')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install

  # gtk2 gui
  install -Dm755 ${pkgname}_gui "$pkgdir/usr/bin/${pkgname}_gui"

  # doc
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

