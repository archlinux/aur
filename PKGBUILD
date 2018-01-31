# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx.de>

pkgname=gfa
pkgver=0.4.1
pkgrel=2
pkgdesc="Small and fast address book written in C and GTK+2"
arch=('x86_64')
url="http://gfa.sourceforge.net"
license=('GPL2')
depends=('sqlite' 'gtk2')
source=(https://sourceforge.net/projects/gfa/files/$pkgname-$pkgver.tar.gz
        gfa.desktop)
md5sums=('12337963c40946ab5145f04f0a07a2d6'
         '19bdc40fe78043fbf31ee32b6a5f2c14')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  make DESTDIR="$pkgdir" install
}
