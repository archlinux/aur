# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: speps <speps at aur dot archlinux dor org>

pkgname=qmidinet
pkgver=0.4.0
pkgrel=1
pkgdesc="A MIDI Network Gateway via UDP/IP Multicast"
arch=(i686 x86_64)
url="http://qmidinet.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qtchooser' 'alsa-lib' 'jack')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('403d33cd5f0d699f6c6841babf94b985')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
