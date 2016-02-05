# Maintainer: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mk-configure
pkgver=0.29.1
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep' 'makedepend')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('3350707b519560b0cf99979d06bf806949df6558f84306a33aec419b766f57ca')

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
