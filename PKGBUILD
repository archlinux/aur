# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=15.1.0
pkgrel=2
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=("https://sourceforge.net/projects/$pkgname/files/gambit15/$pkgver/$pkgname-$pkgver.tar.gz" ludecomp.diff)
md5sums=('b7a096147c71101873cdaf2835a3608a'
         '4086c9c74892440e00c9be7f8ace4bce')
options=('!makeflags')

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --disable-enumpoly
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
