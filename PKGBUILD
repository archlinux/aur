# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=sdlada
pkgver=2.5.3
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2_ttf")

source=(https://github.com/Lucretia/sdlada/archive/v$pkgver.tar.gz)
md5sums=('8d0245cb6c03db3ed136c012d4cc9055')


build()
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make -j1 SDL_PLATFORM=linux SDL_BUILD=static SDL_MODE=release 
}


package() 
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make  SDL_PLATFORM=linux  SDL_BUILD=static  SDL_MODE=release  DESTDIR=$pkgdir/usr  install
}
