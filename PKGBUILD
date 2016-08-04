# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=hython
pkgver=1.0.0
pkgrel=2
pkgdesc="Haskell-powered Python 3 interpreter"
url="https://github.com/mattgreen/hython"
arch=('any')
license=('GPL')
depends=('ghc>=7.10.2' 'ghc<7.10.3' 'stack')
source=("git://github.com/mattgreen/hython.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
   cd "$srcdir/$pkgname"

   mkdir -p "$pkgdir/opt/hython"
   cp -R hython lib "$pkgdir/opt/hython"
   mkdir -p "$pkgdir/usr/bin"
   ln -s /opt/hython/hython "$pkgdir/usr/bin/hython"
}

