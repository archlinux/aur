# Contributor: Sietse van der Molen <sietse@vdmolen.eu>
# Contributor: Rod Kay              <charlie5 on #ada at freenode.net>

pkgname=florist
pkgver=2016
pkgrel=1
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('any')
url="http://sourceforge.net/projects/gnat-florist/"
license=('GPL3')

groups=()

depends=('gcc-ada')
makedepends=()
optdepends=()

provides=()
conflicts=()
replaces=()
backup=()

options=(staticlibs)

noextract=()
install=
changelog=

source=('http://mirrors.cdn.adacore.com/art/57399229c7a447658e0aff79')

md5sums=('c739f1c1e724b177a7bbc682435d2df3')



build() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  ./configure --prefix=$pkgdir/usr
  make -j7
}



package() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  make DESTDIR="$pkgdir/" install
}
