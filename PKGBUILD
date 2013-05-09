# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Mario Blättermann <mariobl@gnome.org>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>

pkgname=wmcalclock
_pkgname=wmCalClock
pkgver=1.25
pkgrel=5
pkgdesc="A Calendar clock [WindowMaker dockapp] with antialiased text"
arch=('i686' 'x86_64')
depends=('libxpm')
license=('GPL')
source=(http://dockapps.windowmaker.org/download.php/id/16/$_pkgname-$pkgver.tar.gz)
url="http://www.dockapps.org/file.php/id/9"
md5sums=('70c47ec1d8f8ec7e3ed7eb2d3105d371')

build() {
  cd "$srcdir/$_pkgname-$pkgver/Src"
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver/Src"
  install -Dm0755 wmCalClock   "$pkgdir/usr/bin/wmCalClock"
  install -Dm0655 wmCalClock.1 "$pkgdir/usr/share/man/man1/wmCalClock.1"
}

