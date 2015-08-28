# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>
pkgname=dclock
pkgver=2.2.2
pkgrel=5
pkgdesc="Digital clock for X"
url="http://opencircuitdesign.com/~tim/programs/"
license=('GPL')
depends=('libxft' 'libxt' 'libxext')
makedepends=('imake')
source=(http://ftp.de.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('2e9cd689201a62d4a15daf93e45a4e3b')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  xmkmf
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 dclock $pkgdir/usr/bin/dclock
  install -D -m 644 dclock.1 $pkgdir/usr/share/man/man1/dclock.1
}
