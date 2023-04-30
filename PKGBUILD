# Maintainer:  Rod Kay              <rodakay5 at gmail.com>
# Contributor: Sietse van der Molen <sietse@vdmolen.eu>

pkgname=florist
pkgver=2023
pkgrel=1
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('i686' 'x86_64')
url="https://github.com/Blady-Com/florist"
license=('GPL3')

depends=('gcc-ada')
options=(staticlibs !strip)

source=('git+https://github.com/Blady-Com/florist.git')
sha256sums=(SKIP)


build() 
{
  cd "$srcdir/$pkgname"

  ./configure --prefix=$pkgdir/usr --with-build-type=Production
  PROCESSORS="$(nproc)" make
}


package() 
{
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
