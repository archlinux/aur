# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: hm_b <holger@music-nerds.net>
# Contributor: Leslie P. Polzer <polzer@stardawn.org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jack_capture
pkgver=0.9.73
pkgrel=2
pkgdesc="Simple command line tool to record JACK audio output to a file"
arch=('i686' 'x86_64')
url="https://github.com/kmatheussen/jack_capture"
license=('GPL')
depends=('jack' 'lame' 'liblo')
optdepends=('meterbridge: levels monitor'
            'zenity: gtk2 gui')
source=("https://github.com/kmatheussen/${pkgname}/archive/$pkgver.tar.gz")
md5sums=('5daf67e963dc587eec358274cfd14a88')


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

