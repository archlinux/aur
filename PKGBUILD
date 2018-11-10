# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819 at gmail dot com>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmweather+
pkgver=2.17
pkgrel=1
pkgdesc="Downloads the National Weather Service METAR bulletins, ANV and MRF forecasts, and any weather map for display in a WindowMaker dockapp"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wmweatherplus"
license=('GPL')
groups=('x11')
depends=('pcre' 'libxpm' 'curl' 'windowmaker')
source=("http://downloads.sf.net/wmweatherplus/$pkgname-$pkgver.tar.gz")
md5sums=('89da7675017b1ca8c456e5736ff03249')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
