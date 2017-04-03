# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: Simon Schneider <schneida dot simon at gmail dot com>
pkgname=ctronome
pkgver=0.5.6
pkgrel=2
pkgdesc="A simple metronome for the commandline"
arch=('armv7h' 'i686' 'x86_64')
url="http://ctronome.kign.org/"
license=('GPL2')
source=("http://ctronome.kign.org/source/$pkgname-$pkgver.tar.gz")
md5sums=('29e3ae6bbc1fb32a429ab1613c374e87')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/$pkgname/"
  install -d "$pkgdir/usr/bin/"
  cp *.wav "$pkgdir/usr/share/$pkgname/"
  install -Dm755 $pkgname "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
