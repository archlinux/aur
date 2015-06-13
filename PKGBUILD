# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=pure-gsl
pkgver=0.12
pkgrel=1
pkgdesc="A Pure module which aims to provide a complete interface to the GNU Scientific Library"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'gsl')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('6e686e704fc35fb0029f810a5d39dc50b878b59e')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
