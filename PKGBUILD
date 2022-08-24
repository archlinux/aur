# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=regina
_pkgsuffix=rexx

pkgname=regina-rexx-das
pkgver=3.9.5
pkgrel=1
pkgdesc="An implementation of a Rexx interpreter, compliant with the ANSI Standard for Rexx (1996)"
arch=('i686' 'x86_64')
url="http://regina-rexx.sourceforge.net/"
license=('LGPL')
depends=('bash')
provides=('rexx')
options=('!makeflags')
source=(http://downloads.sourceforge.net/regina-rexx/$_pkgname-$_pkgsuffix-$pkgver.tar.gz)
sha256sums=('08e9a9061bee0038cfb45446de20766ffdae50eea37f6642446ec4e73a2abc51')

build() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"
  CC=gcc ./configure \
   --prefix=/usr \
   --libdir=/usr/lib \
   --sysconfdir=/etc
  
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"
  make DESTDIR=$pkgdir install  
}
