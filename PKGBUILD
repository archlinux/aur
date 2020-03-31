# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mk-configure
pkgver=0.34.1
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('598df0b97d72b33be614b537d00c8c6841e751cd6e135de6bfed710ee91f431a')

build() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep all
}

package() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep DESTDIR="$pkgdir" install
}
