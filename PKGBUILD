# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=temperature.app
_pkgname=Temperature.app
pkgver=1.5
pkgrel=3
pkgdesc="Window Maker applet which info from http://weather.noaa.gov and displays it"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/86"
url="http://web.archive.org/web/20121113072524/http://dockapps.windowmaker.org/file.php/id/86"
license=('GPL')
depends=('libxpm' 'wget')
#source=("http://dockapps.windowmaker.org/download.php/id/816/$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz")
md5sums=('e8d294085ebbe062f0d7b02dfb1d1071')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
