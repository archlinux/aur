# Contributor: Sietse van der Molen <sietse@vdmolen.eu>
# Contributor: Rod Kay              <charlie5 on #ada at freenode.net>

pkgname=florist
pkgver=2017
pkgrel=2
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('any')
url="http://sourceforge.net/projects/gnat-florist/"
license=('GPL3')

depends=('gcc-ada')
options=(staticlibs)

source=('http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deed009')
sha1sums=('7f3fb3e1ccee420cab1172836064915bb586e3e4')


build() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  ./configure --prefix=$pkgdir/usr
  PROCESSORS="$(nproc)" make
}


package() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  make DESTDIR="$pkgdir/" install
}
