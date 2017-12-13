# Maintainer: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mk-configure
pkgver=0.29.3
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep' 'makedepend')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('fbdbacb8eb04566890dd71c1e65226c9714a2557f7f6f3283f6e2a6bc22d4fa9')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep all
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep DESTDIR="$pkgdir" install
}
