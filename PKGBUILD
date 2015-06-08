# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Otakar Truněček <otakar.trunecek@gmail.com>

pkgname=vcp-git
pkgver=2.2
pkgrel=6
pkgdesc="Visual cp: a cp program with some scrollbars"
arch=('i686' 'x86_64')
url="https://github.com/Leask/VCP"
license=('custom:BSD')
depends=('ncurses')
makedepends=('git')
provides=('vcp')
conflicts=('vcp')
backup=('etc/vcp.conf')
source=("git+https://github.com/Leask/VCP")
md5sums=('SKIP')
_gitname="VCP"

build() {
  cd "$srcdir"/"$_gitname"
  make 
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m 755 -o root -g root vcp $pkgdir/usr/bin/vcp
  install -D -m 644 -o root -g root vcp.1.gz \
    $pkgdir/usr/share/man/man1/vcp.1.gz
  install -D -m 644 -o root -g root vcp.pl.1.gz \
    $pkgdir/usr/share/man/pl/man1/vcp.1.gz
  install -D -m 644 -o root -g root vcp.conf.sample \
    $pkgdir/etc/vcp.conf
  install -D -m 644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
