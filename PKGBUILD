# Maintainer: David Birks <david@tellus.space>
# Contributor: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Joseph Kern <timetrap AT gmail DOT com>
# package modding by g99


#   ./utimer -t 3       #  will show a 3 seconds countdown.  for whoever needing such stuff



pkgname=utimer
pkgver=0.4
pkgrel=9
pkgdesc="A command-line multifunction timer tool"
url="https://sourceforge.net/projects/utimer/" 
license=('GPL3') 
makedepends=('intltool')
depends=('glib2')
arch=('x86_64' 'i686')
source=("https://launchpad.net/utimer/0.4/0.4/+download/utimer-$pkgver.tar.gz") 
sha256sums=('07a9d28e15155a10b7e6b22af05c84c878d95be782b6b0afaadec2f7884aa0f7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr/"
}
