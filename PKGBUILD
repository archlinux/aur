# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mk-configure
pkgver=0.34.2
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('4f18c3b7922cd81a7d3caf50f0ecf2cd2107bb8b94838fb6d4e10eece67e9b01')

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
