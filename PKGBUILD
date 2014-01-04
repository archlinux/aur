# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819 at gmail dot com>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmweather+
pkgver=2.13
pkgrel=4
pkgdesc="Downloads the National Weather Service METAR bulletins, ANV and MRF forecasts, and any weather map for display in a WindowMaker dockapp"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/112"
url="http://web.archive.org/web/20121018123103/http://dockapps.windowmaker.org/file.php/id/112"
license=('GPL')
groups=('x11')
depends=('pcre' 'libxpm' 'curl' 'windowmaker') # the libwraster library of windowmaker is the reason this depends on windowmaker.
#source=(http://dockapps.windowmaker.org/download.php/id/846/$pkgname-$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz)
md5sums=(4ee42014f0e07d5d5baafe7c2db3a1fe)
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -c $pkgname $pkgdir/usr/bin/
  cd ..
}

