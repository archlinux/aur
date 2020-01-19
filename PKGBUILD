# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mk-configure
pkgver=0.33.0
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('eb0695df721c570c0ba3b69f88ef10b7d67d65690482b52fba22eefed9055814')

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
