# Contributor: Christopher Fair <christopherpfair@comcast.net>
pkgname=pente
pkgver=2.2.5
pkgrel=1
arch=('any')
pkgdesc="A five in a row game that can be played with X, curses, or text."
url="https://gitlab.com/chrisfair/penteold/-/archive/v2.2.5/penteold-v2.2.5.tar.gz"
license=('GPL2')
depends=(xorg-server ncurses)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://gitlab.com/chrisfair/penteold/-/archive/v2.2.5/${pkgname}old-v${pkgver}.tar.gz")
md5sums=('9a822798954321ceea3e2035a7ab5bb7')
build() { 
     dirname=$srcdir/${pkgname}old-v${pkgver}
     cd $dirname 
     ./configure  --prefix=/usr
     make || return 1
}

package() {
  dirname=$srcdir/${pkgname}old-v${pkgver}
  cd $dirname 
  mkdir -p $pkgdir/usr/man/man6
  mkdir -p $pkgdir/usr/bin
  cp pente-* $pkgdir/usr/bin/pente
  cp man6/pente.6 $pkgdir/usr/man/man6/
}

