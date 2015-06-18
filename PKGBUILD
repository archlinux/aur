# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=gjacktransport
pkgver=0.5.3
pkgrel=1
pkgdesc="graphical slider for controlling JACK Transport"
arch=('i686' 'x86_64')
url="http://gjacktransport.sourceforge.net/"
license=('GPL')
depends=('lash' 'intltool')
backup=('etc/gjackclockrc' 'etc/gjacktransportrc')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/v0.5/$pkgname-$pkgver.tar.gz")
md5sums=('9d87f1d499a805236206fdba9d30a2fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure \
	--prefix="/usr" \
	--sysconfdir="/etc/"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install desktop files
  install -Dm644 gjackclock.desktop "$pkgdir/usr/share/applications/gjackclock.desktop"
  install -Dm644 gjacktransport.desktop "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
